({
    doInit: function(component, event, helper) {
        var action = component.get('c.getCategorieImpacts');
        action
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        component.set("v.categorieImpacts", response
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
            newItem.Categorie_Impact__c = component.find("categorieImpactId").get("v.value");

            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                   var evt = $A.get("e.c:eventNewImpactRisqueCreated");
					evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'Impact__c',
                        'Name': '',
                        'Description__c': '',
                        'Categorie_Impact__c':'',
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