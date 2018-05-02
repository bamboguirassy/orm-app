({
    doInit : function(component, event, helper) {
        //get clabels
	    var getFieldsLabelAction=component.get('c.getObjectFields');
        getFieldsLabelAction.setCallback(this, function(response){
            if(response.getState()=='SUCCESS'){
                component.set('v.clabels',response.getReturnValue()); 
                
            } else {
                    alert('Une erreur est survenues lors de la récuperation des champs'); }
        });
    
        var action = component.get('c.findUserEntites');
        action.setParams({
            //'entite' : component.get('v.entite')
            'entite' : component.get('v.paramRisqueEntite').entite__c
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
        $A.enqueueAction(getFieldsLabelAction);
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
            newItem.ParamRisqueEntite__c = component.get('v.paramRisqueEntite').Id;
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
                            
                            component.set("v.isOpen", false);
                        }
                    });
            $A.enqueueAction(action);
            

        } else {
            alert("ajout échouée");
        }
        
    },

})