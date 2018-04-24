({
    createItem: function(component, event, helper) {
        var nomField = component.find("nom");
        var nom = nomField.get("v.value");
        var isItemValid = true;
        if ($A.util.isEmpty(nom)) {
            isItemValid = false;
            nomField.set("v.errors", [{
                message: "Le nom ne peut etre vide."
            }]);
        } else {
            nomField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            newItem.activite__c = component.get('v.activite');
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action
                .setCallback(
                    this,
                    function(response) {
                        var state = response.getState();
                        if (component.isValid() && state == "SUCCESS") {
                            // refresh list
                            var findAllAction = component
                                .get("c.findAll");
                            findAllAction.setParams({
                                'activite': component
                                    .get('v.activite')
                            });
                            findAllAction
                                .setCallback(
                                    this,
                                    function(response) {
                                        var resStatus = response
                                            .getState();
                                        if (resStatus == "SUCCESS") {
                                            component
                                                .set("v.items",
                                                    response
                                                    .getReturnValue());
                                        } else {
                                            alert("impossible de recuperer la liste aprés ajout");
                                        }
                                    });
                            $A.enqueueAction(findAllAction);

                            component.set("v.item", {
                                'sobjectType': 'Indicateur_Activite__c',
                                'Name': '',
                                'description__c': ''
                            });
                        }
                    });
            $A.enqueueAction(action);

        } else {
            alert("ajout échouée");
        }
        component.set("v.isOpen", false);
    },

})