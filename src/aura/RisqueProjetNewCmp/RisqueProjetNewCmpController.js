({
    doInit : function(component, event, helper) {
		
		//refresh MesurePrevention entité List
		var action = component.get("c.getRisqueEntites");
        action.setParam('entite', component.get('v.projet').Structure__c);
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.risqueEntites", response.getReturnValue());
            } else {
                alert("Echec de la recuperation des risques de l'entité");
            };

        });
        $A.enqueueAction(action);
	},
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.Projet__c = component.get('v.projet').Id;
        newItem.Risque_detecte__c = component.find('risqueEntiteID').get("v.value");


        if ($A.util.isEmpty(newItem.Risque_detecte__c )) {
            alert("le risque ne peut être null, veuillez selectionner une valeur");
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // refresh list
                    var evt = $A.get("e.c:eventNewRisqueProjetCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'Risque_projet__c',
                        'Projet__c': '',
                        'Risque_detecte__c': '',
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