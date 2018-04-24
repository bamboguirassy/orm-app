({
	doInit : function(component, event, helper) {

		var actionRisques = component.get("c.findRisques");
		actionRisques.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
				component.set("v.risques", response.getReturnValue());
			} else {
				alert("Echec de la recuperation des risques");
			}
			;

		});
		$A.enqueueAction(actionRisques);
	},
	openModal : function(component, event, helper) {
		// recuperer l'élément avec l'Id
		helper.openModal(component);
		var action = component.get('c.getElementById');
		action.setParam('Id', event.getParam('Id'));
		action.setCallback(this, function(response) {
			if (response.getState() == 'SUCCESS') {
				component.set('v.item', response.getReturnValue());
				// find user entites
				var actionUserEntite = component.get("c.findUserEntites");
				actionUserEntite.setParam("entite",
						component.get('v.item').Entite__c);
				actionUserEntite.setCallback(this, function(response) {
					var state = response.getState();
					if (state == "SUCCESS") {
						component.set("v.userEntites", response
								.getReturnValue());
					} else {
						alert("Echec de la recuperation des utilisateurs");
					}

				});
				$A.enqueueAction(actionUserEntite);
			} else {
				helper.showToast('Error', "Impossible de recuperer l'élement ",
						'error');
			}
		});
		$A.enqueueAction(action);

	},
	editItem : function(component, event, helper) {
		var newItem = component.get("v.item");

		newItem.Risque__c = component.find('risqueID').get("v.value");
		newItem.responsable__c = component.find('userEntiteID').get("v.value");
		newItem.frequence__c = component.find('frequenceID').get("v.value");
		newItem.gravite__c = component.find('graviteID').get("v.value");
		newItem.maitrise__c = component.find('maitriseID').get("v.value");

		if ($A.util.isEmpty(newItem.Risque__c)) {
			alert("le risque ne peut être null, veuillez selectionner une valeur");
		}
		var action = component.get('c.add');
		action.setParams({
			"item" : newItem
		});
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (component.isValid() && state == "SUCCESS") {
				// refresh list

				var evt = $A.get("e.c:eventNewRisqueEntiteCreated");
				evt.fire();
				component.set("v.item", {
					'sobjectType' : 'Risque_Entite__c',
					'Date_Detection__c' : '',
					'description__c' : '',
					'frequence__c' : '',
					'gravite__c' : '',
					'maitrise__c' : '',
					'responsable__c' : '',
					'Risque__c' : '',
				});
			} else {
				alert("Le formulaire n'est pas valide !");

			}
		});
		$A.enqueueAction(action);

		component.set("v.isOpen", false);
	},

})