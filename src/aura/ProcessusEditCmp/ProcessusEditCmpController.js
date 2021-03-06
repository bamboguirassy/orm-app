({
    doInit: function(component, event, helper) {
     helper.getFieldLabels(component, event);
        // find entites
        var action1 = component.get('c.getEntites');
        action1.setCallback(this, function(response) {
            if (response.getState() == 'SUCCESS') {
                component.set('v.entites', response.getReturnValue());
            } else {
                alert('Impossible de récuperer la liste des entités');
            }
        });
        $A.enqueueAction(action1);
    },
    editItem: function(component, event, helper) {

        var nomField = component.find("intitule");
        var nom = nomField.get("v.value");
        var versionField = component.find("version");
        var version = versionField.get("v.value");
        var dateApplicationField = component.find("dateApplication");
        var dateApplication = dateApplicationField.get("v.value");
        var piloteID = component.find("piloteID").get("v.value");
        var copiloteID = component.find("copiloteID").get("v.value");
        var proprietaire = component.find('proprietaireID').get('v.value');

        var isItemValid = true;
        if ($A.util.isEmpty(nom) || $A.util.isEmpty(version) || $A.util.isEmpty(dateApplication) || $A.util.isEmpty(piloteID)) {
            isItemValid = false;
            nomField.set("v.errors", [{
                message: "Le nom,la version, le pilote et la date d'application ne peuvent etre vides."
            }]);
            alert("Le nom,la version et la date d'application ne peuvent etre vides.");
        } else {
            nomField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            newItem.pilote__c = piloteID;
            newItem.copilote__c = copiloteID;
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    //refresh list
                     var evt = $A.get("e.c:eventNewProcessusCreated");
					evt.fire();
                    component.set("v.item", {
                        'sobjectType': 'Processus__c',
                        'copilote__c': '',
                        'dateApplication__c': '',
                        'finalite__c': '',
                        'Name': '',
                        'pilote__c': '',
                        'reference__c': '',
                        'version__c': ''
                    });
                }
            });
            $A.enqueueAction(action);

        } else {
            alert("modification échouée");
        }
        component.set("v.isOpen", false);
    },
    
    getUserEntites: function(component, event, helper) {
        var selectedEntiteId = component.find('proprietaireID').get('v.value');
        var action = component.get('c.findUserEntites');
        action.setParam("entite", selectedEntiteId);
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                component.set('v.userEntites', response.getReturnValue());
            } else {
                alert('impossible de récuperer la liste des users entités');
            }
        });
        $A.enqueueAction(action);

    },
    openModal : function(component, event, helper) {
    
    	helper.openModal(component);
		var action = component.get('c.getElementById');
		action.setParam('Id', event.getParam('Id'));
		action.setCallback(this, function(response) {
			if (response.getState() == 'SUCCESS') {

				var item = response.getReturnValue();
				component.set('v.item', item);
				console.log("item "+ JSON.stringify(item));
				//david
				var action1 = component.get('c.getEntites');
		        action1.setCallback(this, function(response) {
		            if (response.getState() == 'SUCCESS') {
		            	console.log('entites '+ JSON.stringify(response.getReturnValue()));
		                component.set('v.entites', response.getReturnValue());
		                
		                var actionPil = component.get('c.findUserEntites');
				        actionPil.setParam("entite", item.proprietaire__c);
				        actionPil.setCallback(this, function(response) {
				            if (response.getState() == "SUCCESS") {
				                console.log('v.userEntites '+ JSON.stringify(response.getReturnValue()));
				                component.set('v.userEntites', response.getReturnValue());
				            } else {
				                alert('impossible de récuperer la liste des users entités');
				            }
				        });
				        $A.enqueueAction(actionPil);
		                
		            } else {
		                alert('Impossible de récuperer la liste des entités');
		            }
		        });
		        $A.enqueueAction(action1);
			} else {
				helper.showToast('Error', "Impossible de recuperer l'élement ",
						'error');
			}
		});
		$A.enqueueAction(action);
    }

})