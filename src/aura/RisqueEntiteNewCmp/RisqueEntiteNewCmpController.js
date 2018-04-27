({

    doInit: function(component, event, helper) {
    	helper.getFieldLabels(component, event);
        var action = component.get("c.findUserEntites");
        action.setParam("entite", component.get('v.entite'));
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.userEntites", response.getReturnValue());
            } else {
                alert("Echec de la recuperation des utilisateurs");
            };

        });
        $A.enqueueAction(action);
        var actionRisques = component.get("c.findRisques");
        actionRisques.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.risques", response.getReturnValue());
            } else {
                alert("Echec de la recuperation des risques");
            };

        });
        $A.enqueueAction(actionRisques);
    },
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.Entite__c = component.get('v.entite');
        newItem.Risque__c = component.find('risqueID').get("v.value");
        newItem.responsable__c = component.find('userEntiteID').get("v.value");
        newItem.frequence__c = component.find('frequenceID').get("v.value");
        newItem.gravite__c = component.find('graviteID').get("v.value");
        newItem.maitrise__c = component.find('maitriseID').get("v.value");


        if ($A.util.isEmpty(newItem.responsable__c)) {
            alert("le responsable ne peut être null, veuillez selectionner une valeur");
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // refresh list
                      var evt = $A.get("e.c:eventNewRisqueEntiteCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'Risque_Entite__c',
                        'Date_Detection__c': '',
                        'description__c': '',
                        'frequence__c': '',
                        'gravite__c': '',
                        'maitrise__c': '',
                        'responsable__c': '',
                        'Risque__c': '',
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