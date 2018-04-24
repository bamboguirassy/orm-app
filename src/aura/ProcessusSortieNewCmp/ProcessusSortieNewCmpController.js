({
    doInit : function(component, event, helper) {
		//refresh MesurePrevention entité List
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
        newItem.destination__c = component.find('processusID').get("v.value");
        if ($A.util.isEmpty(newItem.destination__c)) {
            alert("le proessus ne peut être null, veuillez selectionner une valeur");
        } else {
        	//   verify duplication
        	var existe = false;
        	var actionFindPrs = component.get("c.findFromProcessus");
        	actionFindPrs.setParam("processus", component.get('v.processus').Id);
        	actionFindPrs.setCallback(this, function(resp){
        		if(resp.getState() == "SUCCESS"){
        			
        			var processusExistants = resp.getReturnValue();
        			//console.log("processusExistants " + JSON.stringify(processusExistants));
		        	processusExistants.forEach(function(processusExistant){
		        		if(processusExistant.destination__c == newItem.destination__c){
		        			existe = true;
		        		}
		        	});
		        	
		        	if(existe){
		        		alert("Le Processus a dèja été Ajouter");
		        	} else {
		        			        	
		        		var action = component.get('c.add');
			            action.setParams({
			            "item": newItem
			            });
			            action.setCallback(this, function(response) {
			                var state = response.getState();
			                if (component.isValid() && state == "SUCCESS") {
			                    // refresh list
			                    var evt = $A.get("e.c:eventNewProcessusSortieCreated");
			                            evt.fire();
			                    component.set("v.item", {
			                        'sobjectType': 'ProcessusSortie__c',
			                        'processus__c': '',
			                        'destination__c': '',
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