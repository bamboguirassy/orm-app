({
    refreshList: function(component, event) {
        var action = component.get("c.findAll");

        action.setParams({
            'projet': component.get('v.projet').Id
        });

        action
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        component.set("v.items", response
                            .getReturnValue());
                    } else {
                        helper.showToast('Error', "Impossible de recuperer la liste des intervenants du projet", 'error');
                    }

                });
        $A.enqueueAction(action);
    },

})