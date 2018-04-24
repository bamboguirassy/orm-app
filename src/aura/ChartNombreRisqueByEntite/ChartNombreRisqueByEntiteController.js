({
    doInit: function(component, event, helper) {
        component.set("v.title", "Nombre de risques par entité pour une année donnée");
        //populate years
        var annees = [];
        for (var i = 2017; i < 2099; i++) {
            annees.push("" + i);
        }
        component.set("v.annees", annees);
        var types = component.get('v.types');

        var actionInit = component.get("c.findCategorieRisques");
        actionInit
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        var categories = response
                            .getReturnValue();
                        component.set("v.categories", categories);
                        var categorie = categories[0].Id;
                        var annee = annees[0];
                        var charType = component.find('typeID').get('v.value');
                        var action = component.get('c.risqueByEntite');
                        action.setParams({
                            'categorie': categorie,
                            'annee': annee
                        });
                        action.setCallback(this, function(response) {
                            var state = response.getState();
                            if (state == "SUCCESS") {
                                var result = response.getReturnValue();
                                //draw chart
//                                setTimeout(() => {
                                	helper.drawChart(component, event, charType, result);
//								}, 1000);
                            }
                        });
                        $A.enqueueAction(action);
                    } else {
                        alert("Impossible de recuperer la liste des entités");
                    }
                });
        $A.enqueueAction(actionInit);
    },
    refreshChart: function(component, event, helper) {
        var categorie = component.find('categorieID').get('v.value');
        var annee = component.find('anneeID').get('v.value');
        var charType = component.find('typeID').get('v.value');
        var action = component.get('c.risqueByEntite');
        action.setParams({
            'categorie': categorie,
            'annee': annee
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                var result = response.getReturnValue();

                helper.drawChart(component, event, charType, result);
            }
        });
        $A.enqueueAction(action);
    }
})