({
    refreshList: function(component, event) {
        var action = component.get("c.findFromPartieConcernee");
        action.setParam("partieConcernee", component.get('v.partieConcernee').Id);
        if (component.get('v.partieConcernee')) {
            action
                .setCallback(
                    this,
                    function(response) {
                        var state = response.getState();
                        if (state == "SUCCESS") {
                            component.set("v.items", response
                                .getReturnValue());
                        } else {
                            alert("Impossible de recuperer la liste des entités sources");
                        }

                    });
            $A.enqueueAction(action);
        }
    }

})