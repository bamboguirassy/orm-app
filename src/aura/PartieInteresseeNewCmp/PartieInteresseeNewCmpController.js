({
    
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.PartieConcernee__c = component.get('v.partieConcernee').Id;


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
                    // publier evenement creation
                    var evt = $A.get("e.c:eventNewPartieInteresseeCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'PartieInteressee__c',
                        'PartieConcernee__c': '',
                        'Name': '',
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