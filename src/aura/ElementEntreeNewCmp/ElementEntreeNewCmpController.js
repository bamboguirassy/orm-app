({
    
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.processus__c = component.get('v.processus').Id;


        if ($A.util.isEmpty(newItem.Name)) {
            alert("le libellé ne peut être null, veuillez selectionner une valeur");
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // refresh list
                   var evt = $A.get("e.c:eventNewElementEntreeCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'ElementEntree__c',
                        'processus__c': '',
                        'libelle__c': '',
                    });
                } else {
                alert("Le formulaire n'est pas valide");
                }
            });
            $A.enqueueAction(action);
        }


        component.set("v.isOpen", false);
    },

})