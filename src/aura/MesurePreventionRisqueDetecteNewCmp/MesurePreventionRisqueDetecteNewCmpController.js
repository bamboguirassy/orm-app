({
    doInit : function(component, event, helper) {
		
		//refresh MesurePrevention entité List
        helper.refreshListMP(component,event);
	},
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.risque_Detecte__c = component.get('v.risqueEntite');
        newItem.mesure_Prevention__c = component.find('mesurePreventionID').get("v.value");


        if ($A.util.isEmpty(newItem.mesure_Prevention__c)) {
            alert("la mesure de prévention ne peut être null, veuillez selectionner une valeur");
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // refresh list
                    var findAllAction = component.get("c.findAll");
                    findAllAction.setParam("risqueEntite", component.get('v.risqueEntite'));
                    findAllAction.setCallback(this, function(response) {
                        var resStatus = response.getState();
                        if (resStatus == "SUCCESS") {
                            component.set("v.items", response.getReturnValue());
                        } else {
                            alert("impossible de recuperer la liste aprés ajout");
                        }
                    });
                    $A.enqueueAction(findAllAction);

                    component.set("v.item", {
                        'sobjectType': 'Mesure_Prevention_Risque_Detecte__c',
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

    refreshListMesurePrevention: function(component, event, helper) {
        helper.refreshListMP(component,event);
    }

})