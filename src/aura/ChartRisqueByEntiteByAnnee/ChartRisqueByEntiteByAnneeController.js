({
    doInit: function(component, event, helper) {
        component.set("v.title", "Nombre de risques par entité pour une année donnée");
        //populate years
        var annees = [];
        for (var i = 2017; i < 2099; i++) {
            annees.push("" + i);
        }
        component.set("v.annees", annees);

        var annee = annees[0];
        var types = component.get('v.types');
        var charType = types[0];
        var action = component.get('c.risqueByEntiteAnnee');
        action.setParams({
            'annee': annee
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                var result = response.getReturnValue();
                //                setTimeout(() => {
                helper.drawChart(component, event, charType, result);
                //                }, 1000);
            }
        });
        $A.enqueueAction(action);
    },
    refreshChart: function(component, event, helper) {
        var annee = component.find('anneeID').get('v.value');
        var charType = component.find('typeID').get('v.value');
        var action = component.get('c.risqueByEntiteAnnee');
        action.setParams({
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