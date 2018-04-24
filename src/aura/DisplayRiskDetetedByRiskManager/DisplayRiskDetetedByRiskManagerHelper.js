({
	refreshList: function(component, event) {
        var action = component.get("c.findAllByManagerRisk");
        action.setParam("idRiskManager", component.get('v.riskManager').Id);
        action
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        component.set("v.items", response
                            .getReturnValue());
                    } else {
                        alert("Impossible de recuperer la liste des Risques Détéctés");
                    }

                });
        $A.enqueueAction(action);
       
    }
})