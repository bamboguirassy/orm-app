({
    doInit: function(component, event, helper) {
       //refresh MesurePrevention entité List
       helper.getFieldLabels(component, event);
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
    editItem: function(component, event, helper) {
        var seuilApparutionField = component.find("seuilApparution");
        var seuilApparution = seuilApparutionField.get("v.value");
        var isItemValid = true;
        if ($A.util.isEmpty(seuilApparution)) {
            isItemValid = false;
            seuilApparutionField.set("v.errors", [{
                message: "Le seuilApparution ne peut etre vide."
            }]);
        } else {
            seuilApparutionField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
                   newItem.risque__c = component.find('risqueID').get("v.value");

            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    //refresh list
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
                }
            });
            $A.enqueueAction(action);

        } else {
            alert("modification échouée");
        }
        component.set("v.isOpen", false);
    },

})