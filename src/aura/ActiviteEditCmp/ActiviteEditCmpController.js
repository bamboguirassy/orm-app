({

	openModal : function(component, event, helper) {
	helper.getFieldLabels(component, event);
		// recuperer l'élément avec l'Id
		helper.openModal(component);
		var action = component.get('c.getElementById');
		action.setParam('Id', event.getParam('Id'));
		action
				.setCallback(
						this,
						function(response) {
							if (response.getState() == 'SUCCESS') {
								component.set('v.item', response
										.getReturnValue());
								// contenu du doInit
								/*statuts = [ 'Non fait', 'En cours', 'Fait' ];
								types = [ 'corrective', 'prévention',
										'correction' ];
								component.set('v.statuts', statuts);
								component.set('v.types', types);*/

								var actionUser = component
										.get("c.findUserEntites");
								if (component.get('v.item').plan_Action__r.risque_Entite__c) {
									actionUser
											.setParam(
													"entite",
													component.get('v.item').plan_Action__r.risque_Entite__r.Entite__c);
								} else {
									actionUser
											.setParam(
													"entite",
													component.get('v.item').plan_Action__r.ParamRisqueEntite__r.entite__c);

								}
								actionUser
										.setCallback(
												this,
												function(response) {
													var state = response
															.getState();
													if (state == "SUCCESS") {
														component
																.set(
																		"v.userEntites",
																		response
																				.getReturnValue());
													} else {
														alert("Echec de la recuperation des utilisateurs");
													}
													;

												});
								$A.enqueueAction(actionUser);

							} else {
								helper.showToast('Error',
										"Impossible de recuperer l'élement ",
										'error');
							}
						});
		$A.enqueueAction(action);
	},

	editItem : function(component, event, helper) {
		var libelleField = component.find("libelle");
		var dateField = component.find('date');
		var delaiField = component.find('delai');
		var libelle = libelleField.get("v.value");
		var date = dateField.get('v.value');
		var delai = delaiField.get('v.value');
		var isItemValid = true;
		if ($A.util.isEmpty(libelle) || $A.util.isEmpty(date)
				|| $A.util.isEmpty(delai)) {
			isItemValid = false;
			libelleField.set("v.errors", [ {
				message : "Le libelle ne peut etre vide."
			} ]);
			alert("le libelle,la date, le délai ne peuvent etre vides");
		} else {
			libelleField.set("v.errors", null);
		}
		if (isItemValid) {
			var newItem = component.get("v.item");
			newItem.responsable__c = component.find('userEntiteID').get(
					'v.value');
			newItem.statut__c = component.find('statut').get('v.value');
			newItem.type__c = component.find('type').get('v.value');

			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});
			action.setCallback(this, function(response) {
				var state = response.getState();
				if (component.isValid() && state == "SUCCESS") {

					// deploy event
					var evt = $A.get("e.c:eventNewActiviteCreated");
					evt.fire();

					component.set("v.item", {
						'sobjectType' : 'Activite__c',
						'cout__c' : '',
						'date__c' : '',
						'delai__c' : '',
						'Name' : '',
						'statut__c' : '',
						'responsable__c' : '',
						'type__c' : '',
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