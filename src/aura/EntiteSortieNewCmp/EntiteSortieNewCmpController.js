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
        	var actionEntiteExistants = component.get("c.findFromProcessus");
        	actionEntiteExistants.setParam("processus", component.get('v.processus').Id);
        	actionEntiteExistants.setCallback(this, function(resp){
        		
        		if(resp.getState() == "SUCCESS"){
        			var entiteExistants = resp.getReturnValue();
        			entiteExistants.forEach(function(entiteExistant){
        				if(entiteExistant.entite__c == newItem.entite__c){
        					existe = true;
        				}
        			});
        			
        			if(existe){
        				alert("L'entite existe dèja");
        			} else {
        				
        				var action = component.get('c.add');
			            action.setParams({
			                "item": newItem
			            });
			            action.setCallback(this, function(response) {
			                var state = response.getState();
			                if (component.isValid() && state == "SUCCESS") {
			                    // refresh list
			                    var evt = $A.get("e.c:eventNewEntiteSortieCreated");
			                    evt.fire();
			                    /*var findAllAction = component.get("c.findFromProcessus");
			                    findAllAction.setParam("processus", component.get('v.processus').Id);
			                    findAllAction.setCallback(this, function(response) {
			                        var resStatus = response.getState();
			                        if (resStatus == "SUCCESS") {
			                            component.set("v.items", response.getReturnValue());
			                        } else {
			                            alert("impossible de recuperer la liste aprés ajout");
			                        }
			                    });
			                    $A.enqueueAction(findAllAction);*/
			
			                    component.set("v.item", {
			                        'sobjectType': 'EntiteSortie__c',
			                        'processus__c': '',
			                        'entite__c': '',
			                    });
			                } else {
			                alert("Le formulaire n'est pas valide");
			                }
			            });
			            $A.enqueueAction(action);
        			}        			
        		}       	
        	
        	});
        	$A.enqueueAction(actionEntiteExistants);
        	
            
        }


        component.set("v.isOpen", false);
    },

})