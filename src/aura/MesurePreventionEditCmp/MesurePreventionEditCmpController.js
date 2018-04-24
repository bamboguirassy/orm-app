({
    doInit: function(component, event, helper) {
        var action = component.get('c.getCategorieMesurePreventions');
        action
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        component.set("v.categorieMesurePreventions", response
                            .getReturnValue());
                    } else {
                        alert("Impossible de recuperer la liste des categories");
                    }
                });
        $A.enqueueAction(action);


    },
    editItem: function(component, event, helper) {
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
            newItem.Categorie_Impact__c = component.find("categorieMesurePreventionId").get("v.value");

            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                  if (state == "SUCCESS") {
                            var evt = $A.get("e.c:eventNewMesurePreventionCreated");
                            evt.fire();
component.set("v.item", {
                                'sobjectType': 'Mesure_Prevention__c',
                                'Name': '',
                                'Description__c': '',
                                'CategorieMesurePrevention__c':'',
                            });
                        }
            });
            $A.enqueueAction(action);

        } else {
            alert("modification échouée");
        }
        component.set("v.isOpen", false);
    },

})