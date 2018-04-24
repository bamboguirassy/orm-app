({
    
    editItem: function(component, event, helper) {
        var descriptionField = component.find("description");
        var description = descriptionField.get("v.value");
        var valeurField = component.find("valeur");
        var valeur = valeurField.get("v.value");
        var isItemValid = true;
        if ($A.util.isEmpty(description)||$A.util.isEmpty(valeur)) {
            isItemValid = false;
            descriptionField.set("v.errors", [{
                message: "Le seuilApparution ne peut etre vide."
            }]);
        } else {
            descriptionField.set("v.errors", null);
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
                     var evt = $A.get("e.c:eventNewPREtrackerCreated");
					evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'PREtracker__c',
                        'description__c': '',
                        'valeur__c': '',
                        'ParamRisqueEntite__c':''
                    });
                }
            });
            $A.enqueueAction(action);

        } else {
            alert("modification échouée");
        }
        component.set("v.isOpen", false);
        //repeter la ligne pour obliger la fermeture du composant
        component.set("v.isOpen", false);
    },

})