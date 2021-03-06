({
    doInit : function(component, event, helper) {
		
		//refresh MesurePrevention entité List
		helper.getFieldLabels(component, event);
		var action = component.get("c.getProcessus");
        action.setParam('entite', component.get('v.processus').proprietaire__c);
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.processusList", response.getReturnValue());
            } else {
                alert("Echec de la recuperation des processus de l'entité");
            };

        });
        $A.enqueueAction(action);
	},
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.processus__c = component.get('v.processus').Id;
        newItem.source__c = component.find('processusID').get("v.value");

        if ($A.util.isEmpty(newItem.source__c)) {
            alert("le proessus ne peut être null, veuillez selectionner une valeur");
        } else {        	
        	//   verify duplication 
        	var existe = false;
        	var actionFindPrs = component.get("c.findFromProcessus");
        	actionFindPrs.setParam("processus", component.get('v.processus').Id);
        	actionFindPrs.setCallback(this, function(resp){
        		if(resp.getState() == "SUCCESS"){        		
        			var processusExistants = resp.getReturnValue();
        			//console.log(JSON.stringify(processusExistants));
		        	processusExistants.forEach(function(processusExistant){
		        		if(processusExistant.source__c == newItem.source__c){
		        			existe = true;
		        		}
		        	});
		        	
		        	if(existe){        		
		        		//alert("Le Processus a dèja été ajouté");
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
			                   var evt = $A.get("e.c:eventNewProcessusEntreeCreated");
			                   evt.fire();
			
			                    component.set("v.item", {
			                        'sobjectType': 'ProcessusEntree__c',
			                        'processus__c': '',
			                        'source__c': '',
			                    });
			                } else {
			                alert("Le formulaire n'est pas valide");
			                }
			            });
			            $A.enqueueAction(action);
		        	}
		        	
        		}
        	});
        	
        	$A.enqueueAction(actionFindPrs);
        }
        component.set("v.isOpen", false);
    },

})