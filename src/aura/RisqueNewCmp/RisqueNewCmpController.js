({
    doInit: function(component, event, helper) {
        helper.refreshList(component,event);
    },
    createItem: function(component, event, helper) {
        var nomField = component.find("nom");
        var nom = nomField.get("v.value");
        var isItemValid = true;
        if ($A.util.isEmpty(nom)) {
            isItemValid = false;
            nomField.set("v.errors", [{
                message: "Le nom ne peut etre vide."
            }]);
           // alert('le nom ne peut etre vide');
           component.set("v.isMissedValue", true);
        } else {
            nomField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            newItem.categorieRisque__c = component.find("categorieRisqueId").get("v.value");
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action
                .setCallback(
                    this,
                    function(response) {
                        var state = response.getState();
                        if (state == "SUCCESS") {
                            var evt = $A.get("e.c:eventNewRisqueCreated");
                            evt.fire();

                            component.set("v.item", {
                                'sobjectType': 'Risque__c',
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

    refreshListCategorie: function(component, event, helper) {
        helper.refreshList(component,event);
    }

})