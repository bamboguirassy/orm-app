({
    editItem: function(component, event, helper) {
        var nomField = component.find("nom");
        var nom = nomField.get("v.value");
        var isItemValid = true;
        if ($A.util.isEmpty(nom)) {
            isItemValid = false;
            nomField.set("v.errors", [{
                message: "Le nom  ne peut etre vide."
            }]);
        } else {
            nomField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    //refresh list
                   var evt = $A.get("e.c:eventNewMesureActiviteCreated");
					evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'Mesure__c',
                        'Name': '',
                        'description__c': ''
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