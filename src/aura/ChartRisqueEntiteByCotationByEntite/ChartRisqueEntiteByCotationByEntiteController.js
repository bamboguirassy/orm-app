({
    doInit: function(component, event, helper) {
        component.set("v.title", "Nombre de risques detectés par cotation pour une entité donnée par année");
        //populate years
        var annees = [];
        for (var i = 2017; i < 2099; i++) {
            annees.push("" + i);
        }
        component.set("v.annees", annees);
        var types = component.get('v.types');

        var actionInit = component.get("c.findEntites");
        actionInit
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        var entites = response
                            .getReturnValue();
                        component.set("v.entites", entites);
                        var entite = entites[0].Id;
                        var annee = annees[0];
                        var charType = component.find('typeID').get('v.value');
                        var action = component.get('c.risqueEntiteByCotationByEntite');
                        action.setParams({
                            'entite': entite,
                            'annee': annee
                        });
                        action.setCallback(this, function(response) {
                            var state = response.getState();
                            if (state == "SUCCESS") {
                                var result = response.getReturnValue();
                                component.set("v.result", result);
                                //draw chart
                                helper.drawChart(component, event, charType, result);
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
        var entite = component.find('entiteID').get('v.value');
        var annee = component.find('anneeID').get('v.value');
        var charType = component.find('typeID').get('v.value');
        var action = component.get('c.risqueEntiteByCotationByEntite');
        action.setParams({
            'entite': entite,
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
    },
})