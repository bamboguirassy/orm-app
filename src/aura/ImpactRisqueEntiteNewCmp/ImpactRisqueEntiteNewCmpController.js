({
    doInit : function(component, event, helper) {
		//refresh MesurePrevention entité List
		helper.getFieldLabels(component, event);
        helper.refreshList(component,event);
		
	},
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.risque_Entite__c = component.get('v.risqueEntite').Id;
        newItem.ImpactRisque__c = component.find('impactID').get("v.value");


        if ($A.util.isEmpty(newItem.ImpactRisque__c)) {
            alert("l'impact ne peut être null, veuillez selectionner une valeur");
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // refresh list
                    var evt = $A.get("e.c:eventNewImpactRisqueEntiteCreated");
                    evt.fire();
                 
                    component.set("v.item", {
                        'sobjectType': 'Impact_Risque_Entite__c',
                        'mesure_Prevention__c': '',
                        'risque_Detecte__c': '',
                    });
                } else {
                alert("Le formulaire n'est pas valide");
                }
            });
            $A.enqueueAction(action);
        }


        component.set("v.isOpen", false);
    },

    refreshListImpactRisqueEntite: function(component, event, helper) {
        helper.refreshList(component,event);
    }

})