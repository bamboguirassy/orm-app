({
    doInit : function(component, event, helper) {
		helper.getFieldLabels(component, event);
		//refresh MesurePrevention entité List
		var action = component.get("c.getRisqueEntites");
        action.setParam('entite', component.get('v.processus').proprietaire__c);
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
        newItem.processus__c = component.get('v.processus').Id;
        newItem.risqueEntite__c = component.find('risqueEntiteID').get("v.value");


        if ($A.util.isEmpty(newItem.risqueEntite__c)) {
            alert("le risque ne peut être null, veuillez selectionner une valeur");
           
        } else {
        	// verif duplication        	
        	var risqueAssExistantes = component.get("v.items");
        	var existe = false;
        	if(Array.isArray(risqueAssExistantes)){        	
        		for(var i= 0; i < risqueAssExistantes.length; i++)
				{
				     if(risqueAssExistantes[i].risqueEntite__c == newItem.risqueEntite__c){
				    	 existe = true;
				     }				     
				}
        	} else {
        		if(risqueAssExistantes.Id == newItem.risqueEntite__c){
				    existe = true;
				}
        	}
        	
        	if(existe){
        		//alert("le risque est dèja associé au processus");
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
	                    var findAllAction = component.get("c.findFromProcessus");
	                    findAllAction.setParam("processus", component.get('v.processus').Id);
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
	                        'sobjectType': 'ProcessusRisque__c',
	                        'processus__c': '',
	                        'risqueEntite__c': '',
	                    });
	                } else {
	                	alert("Le formulaire n'est pas valide");
	                }
	            });
	            $A.enqueueAction(action);
	        }
        }
        component.set("v.isOpen", false);
    },
    
})