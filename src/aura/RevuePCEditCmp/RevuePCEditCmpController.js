({
    editItem: function(component, event, helper) {
        var libelleField = component.find("libelle");
        var libelle = libelleField.get("v.value");
        var isItemValid = true;
        if ($A.util.isEmpty(libelle)) {
            isItemValid = false;
            libelleField.set("v.errors", [{
                message: "Le libelle ne peut etre vide."
            }]);
            alert('le libelle ne peut etre vide');
        } else {
            libelleField.set("v.errors", null);
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
                    // refresh list
                    var evt = $A.get("e.c:eventNewRevuePCCreated");
					evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'RevuePC__c',
                        'PartieConcernee__c': '',
                        'Name': '',
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