({
    refreshList: function(component, event) {
        var action = component.get("c.findFromProcessus");
        action.setParam("processus", component.get('v.processus').Id);
        if (component.get('v.processus')) {
            action
                .setCallback(
                    this,
                    function(response) {
                        var state = response.getState();
                        if (state == "SUCCESS") {
                            component.set("v.items", response
                                .getReturnValue());
                                $A.enqueueAction(component.get('c.applyDatatable'));
                        } else {
                            alert("Impossible de recuperer la liste des entités sources");
                        }

                    });
            $A.enqueueAction(action);
        }
    }

})