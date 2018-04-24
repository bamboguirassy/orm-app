({
    refreshList: function(component, event) {
        var action = component.get("c.findAll");
        if (component.get('v.risque') == null) {
            alert("Attention l'id de l'entité est null");
        } else {
            action.setParams({
                'risque': component.get('v.risque')
            });
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
                            alert("Impossible de recuperer la liste des impacts risque dans impact risque");
                        }

                    });
            $A.enqueueAction(action);
        }
    }
})