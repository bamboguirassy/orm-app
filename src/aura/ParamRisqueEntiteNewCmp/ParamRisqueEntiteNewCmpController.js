({
    doInit: function(component, event, helper) {
    	helper.getFieldLabels(component, event);
        //refresh MesurePrevention entité List
        var action = component.get("c.getRisques");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.risques", response.getReturnValue());
            } else {
                alert("Echec de la recuperation des risques");
            };

        });
        $A.enqueueAction(action);
    },
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.entite__c = component.get('v.entite').Id;
        newItem.risque__c = component.find('risqueID').get("v.value");
        newItem.apparu__c = false;


        if ($A.util.isEmpty(newItem.risque__c)) {
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
                    var evt = $A.get("e.c:eventNewParamRisqueEntiteCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'ParamRisqueEntite__c',
                        'entite__c': '',
                        'risque__c': '',
                        'seuilApparution__c': '',
                        'unite__c': '',
                        'apparu__c': '',
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