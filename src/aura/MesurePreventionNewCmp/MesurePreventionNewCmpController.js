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
                message: ""+ component.get("v.alertMessage")
            }]);
           // alert('le nom ne peut etre vide');
        } else {
            nomField.set("v.errors", null);
       
        if (isItemValid) {
            var newItem = component.get("v.item");
            newItem.CategorieMesurePrevention__c = component.find("categorieMesurePreventionId").get("v.value");
            newItem.Risque__c=component.get('v.risque');
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
            alert("ajout échouée");
        }
        component.set("v.isOpen", false);
         }
    },

    refreshListMesurePrevention: function(component, event, helper) {
        helper.refreshList(component,event);
    }


})