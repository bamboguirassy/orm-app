({

    openModal : function(component, event, helper) {
        // recuperer l'élément avec l'Id
        helper.openModal(component);
        var action = component.get('c.getElementById');
        action.setParam('Id', event.getParam('Id'));
        action.setCallback(this, function(response) {
            if (response.getState() == 'SUCCESS') {
                component.set('v.item', response.getReturnValue());

                var actionUser = component.get('c.findUserEntites');
                actionUser.setParams({
                    'entite' : component.get('v.item').risque_Entite__r.Entite__c
                });
                actionUser.setCallback(this, function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        component.set("v.userEntites", response.getReturnValue());
                        
                    } else {
                        helper.showToast("ERREUR",
                                "Impossible de recuperer la liste des gestionnaires",
                                "error");
                    }
                });
                $A.enqueueAction(actionUser);
               

            } else {
                helper.showToast('Error', "Impossible de recuperer l'élement ",
                        'error');
            }
        });
        $A.enqueueAction(action);
    },

    editItem: function(component, event, helper) {
        var libelleField = component.find("libelle");
        var dateCreationField = component.find('dateCreation');
        var echeancierField = component.find('echeancier');
        var libelle = libelleField.get("v.value");
        var dateCreation = dateCreationField.get('v.value');
        var echeancier = echeancierField.get('v.value');
        var isItemValid = true;
        if ($A.util.isEmpty(libelle) || $A.util.isEmpty(dateCreation) || $A.util.isEmpty(echeancier)) {
            isItemValid = false;

        } else {
            libelleField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            newItem.gestionnaire__c = component.find('userEntiteID').get('v.value');

            /*if ($A.util.isEmpty(newItem.gestionnaire__c)) {
                alert("le responsable ne peuvent être null, veuillez selectionner une valeur");
            }*/
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            
            	action.setCallback(this, function(response) {
				var state = response.getState();
				if (component.isValid() && state == "SUCCESS") {
					// deploy add event
					var evt = $A.get("e.c:eventNewPlanActionCreated");
					evt.fire();
					component.set("v.item", {
                        'sobjectType': 'Plan_Action__c',
                        'commentaire__c': '',
                        'date_commencement__c': '',
                        'echeancier__c': '',
                        'etat__c': '',
                        'gestionnaire__c': '',
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