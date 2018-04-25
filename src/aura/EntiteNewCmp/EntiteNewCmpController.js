({
    doInit: function(component, event, helper) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.entites", response.getReturnValue());
            } else {
                alert("Echec de la recuperation des structures");
            };

        });
        $A.enqueueAction(action);
        helper.getFieldLabels(component, event);
    },
    createItem: function(component, event, helper) {
        var nomField = component.find("nom");
        var phoneField = component.find("phone");
        var nom = nomField.get("v.value");
        var phone = phoneField.get('v.value');
        var isItemValid = true;
        if ($A.util.isEmpty(nom) || $A.util.isEmpty(phone)) {
            isItemValid = false;
            nomField.set("v.errors", [{
                message: "Le nom de l'entité ne peut etre vide."
            }]);
        } else {
            nomField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            
            newItem.ParentId=component.find('entiteParentID').get("v.value");
            
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // publier evenement creation
                    var evt = $A.get("e.c:eventNewEntiteCreated");
                            evt.fire();
                

                    component.set("v.item",{
						'sobjectType' : 'Account',
						'Name':'',
						'Phone':'',
						'Website':'',
						'Description':'',
						'ParentId':''
						
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