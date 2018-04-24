({
    refreshList: function(component, event) {
        var action = component.get("c.findFromEntite");
        action.setParam("entite", component.get('v.entite').Id);
        if (component.get('v.entite')) {
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