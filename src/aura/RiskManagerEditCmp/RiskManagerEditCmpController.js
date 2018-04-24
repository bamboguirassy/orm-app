({

    doInit: function(component, event, helper) {

    },
    editItem: function(component, event, helper) {

        var newItem = component.get("v.item");


        if ($A.util.isEmpty(newItem.LastName)) {
            helper.showToast('Error',"Le nom ne peut être null, veuillez selectionner une valeur",'error');
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state == "SUCCESS") {
                    // deploy evenement d'ajout
                    var evt = $A.get("e.c:eventNewRiskManagerCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'Contact',
                        'Birthdate': '',
                        'Description': '',
                        'Email': '',
                        'FirstName': '',
                        'LastName': '',
                        'Phone': '',
                        'PhotoUrl': '',
                    });
                } else {
                    helper.showToast('Error',"L'ajout du gestionnaire a échoué",'error');
                }
            });
            $A.enqueueAction(action);
        }


        component.set("v.isOpen", false);
    },

})