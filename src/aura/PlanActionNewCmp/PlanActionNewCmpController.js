({
    doInit : function(component, event, helper) {
        var action = component.get('c.findUserEntites');
        action.setParams({
            //'entite' : component.get('v.entite')
            'entite' : component.get('v.risqueEntite').Entite__c
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.userEntites", response.getReturnValue());
                
            } else {
                helper.showToast("ERREUR",
                        "Impossible de recuperer la liste des userEntites",
                        "error");
            }
        });
        $A.enqueueAction(action);

    },


    createItem: function(component, event, helper) {
        var libelleField = component.find("libelle");
        var dateCreationField = component.find('dateCreation');
        var echeancierField = component.find('echeancier');
        var libelle = libelleField.get("v.value");
        var dateCreation = dateCreationField.get('v.value');
        var echeancier = echeancierField.get('v.value');
        var isItemValid = true;
        if ($A.util.isEmpty(libelle) || $A.util.isEmpty(dateCreation) || $A.util.isEmpty(echeancier)) {
            isItemValid = false;
            libelleField.set("v.errors", [{
                message: "Le libelle ne peut etre vide."
            }]);
            alert("le libelle,la date de creation, l'écheancier ne peuvent etre vides");
        } else {
            libelleField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            //newItem.risque_Entite__c = component.get('v.risqueEntite');
            newItem.risque_Entite__c = component.get('v.risqueEntite').Id;
            newItem.gestionnaire__c = component.find('userEntiteID').get('v.value');
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
                            var evt = $A.get("e.c:eventNewPlanActionCreated");
                            evt.fire();

                            component.set("v.item", {
                                'sobjectType': 'Plan_Action__c',
                                'commentaire__c': '',
                                'date_commencement__c': '',
                                'echeancier__c': '',
                                'etat__c': '',
                                'gestionnaire__c': '',
                                'Name': ''
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