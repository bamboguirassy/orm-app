({
    refreshList: function(component, event) {

        if (component.get('v.entite') != null) {
            action = component.get('c.findAll');
            action.setParam("entite", component.get('v.entite').Id);

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
                            alert("Impossible de recuperer la liste des gestionnaires de risque");
                        }

                    });
            $A.enqueueAction(action);
        }

    }
})