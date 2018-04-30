({
    refreshList: function(component, event) {
        var action = component.get("c.findAll");
        action.setParam("projet", component.get('v.projet').Id);
        if (component.get('v.projet')) {
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
                            alert("Impossible de recuperer la liste des risques detectés");
                        }
                    });
            $A.enqueueAction(action);
        }
    }
})