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
            newItem.Categorie_Impact__c = component.find("categorieImpactId").get("v.value");
            newItem.risque__c=component.get('v.risque');
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
                            var evt = $A.get("e.c:eventNewImpactRisqueCreated");
					       evt.fire();

                            component.set("v.item", {
                                'sobjectType': 'Impact__c',
                                'Name': '',
                                'description__c': '',
                                'Categorie_Impact__c':'',
                                'risque__c':'',
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

    refreshListCategorieImpactList: function(component, event, helper) {
        helper.refreshList(component,event);
    }


})