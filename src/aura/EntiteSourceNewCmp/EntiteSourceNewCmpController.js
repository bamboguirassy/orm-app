({
    doInit : function(component, event, helper) {
			helper.getFieldLabels(component, event);
		//refresh MesurePrevention entité List
		var action = component.get("c.getEntites");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.entites", response.getReturnValue());
            } else {
                alert("Echec de la recuperation des entités");
            };

        });
        $A.enqueueAction(action);
	},
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.processus__c = component.get('v.processus').Id;
        newItem.entite__c = component.find('entiteID').get("v.value");


        if ($A.util.isEmpty(newItem.entite__c)) {
            alert("l'entité ne peut être null, veuillez selectionner une valeur");
        } else {
        	
        	var existe = false;
        	var actionEntiteExistant = component.get("c.findFromProcessus");
        	actionEntiteExistant.setParam("processus", component.get('v.processus').Id);
        	actionEntiteExistant.setCallback(this, function(resp){
        		
        		var entiteExistants = resp.getReturnValue();
        		entiteExistants.forEach(function(entiteExistant){
        			
        			if(entiteExistant.entite__c == newItem.entite__c){
        				existe = true;
        			}
        		});
        		
        		if(existe) {
        			//alert("L'entite a dèja été ajouter");
        			component.set("v.isDuplicateValueDetected", true);
        		} else {
        			var action = component.get('c.add');
		            action.setParams({
		                "item": newItem
		            });
		            action.setCallback(this, function(response) {
		                var state = response.getState();
		                if (component.isValid() && state == "SUCCESS") {
		                    // refresh list
		                    var evt = $A.get("e.c:eventNewEntiteSourceCreated");
		                            evt.fire();
		
		                    component.set("v.item", {
		                        'sobjectType': 'EntiteSource__c',
		                        'processus__c': '',
		                        'entite__c': '',
		                    });
		                } else {
		                alert("Le formulaire n'est pas valide");
		                }
		            });
		            $A.enqueueAction(action);
        		}
        	});
        	$A.enqueueAction(actionEntiteExistant);
        	/*
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // refresh list
                    var evt = $A.get("e.c:eventNewEntiteSourceCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'EntiteSource__c',
                        'processus__c': '',
                        'entite__c': '',
                    });
                } else {
                alert("Le formulaire n'est pas valide");
                }
            });
            $A.enqueueAction(action);
        	*/
        }


        component.set("v.isOpen", false);
    },

})