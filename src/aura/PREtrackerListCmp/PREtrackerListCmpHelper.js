({
    refreshList: function(component, event) {
        var action = component.get("c.findFromParamRisqueEntite");
        action.setParam("paramRisqueEntite", component.get('v.paramRisqueEntite').Id);
        if (component.get('v.paramRisqueEntite')) {
            action
                .setCallback(
                    this,
                    function(response) {
                        var state = response.getState();
                        if (state == "SUCCESS") {
                            component.set("v.items", response
                                .getReturnValue());
                        } else {
                            alert("Impossible de recuperer la liste des params");
                        }

                    });
            $A.enqueueAction(action);
        }
    }

})