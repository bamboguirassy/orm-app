({
	doInit : function(component, event, helper) {
	helper.getFieldLabels(component, event);
		var action = component.get("c.getEntites");
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
				component.set("v.entites", response.getReturnValue());
			} else {
				alert("Echec de la recuperation des entités");
			}
			;

		});
		$A.enqueueAction(action);
	},
	createItem : function(component, event, helper) {

		var newItem = component.get("v.item");
		newItem.risque_Entite__c = component.get('v.risqueEntite');
		newItem.Entite__c = component.find('entiteID').get("v.value");
		if ($A.util.isEmpty(newItem.Entite__c)) {
			alert("l'entité ne peut être null, veuillez selectionner une valeur");
		} else {

			var entitesExistant = component.get("v.items");
			// if (Array.isArray(entitesExistant)) {
			
			var existe = false;
			for (var i = 0; i < entitesExistant.length; i++) {
				if (entitesExistant[i].Entite__c == newItem.Entite__c) {
					
					existe = true;
				}
			}
			
			if(existe){
				component.set("v.isDuplicateValueDetected", true);
			} else {
					var action = component.get('c.add');
					action.setParams({
						"item" : newItem
					});
					action
							.setCallback(
									this,
									function(response) {
										var state = response.getState();
										if (component.isValid()
												&& state == "SUCCESS") {
											// refresh list
											 var evt = $A.get("e.c:eventNewEntiteAffecteeCreated");
											 	evt.fire();
										

											component
													.set(
															"v.item",
															{
																'sobjectType' : 'Entite_Affectee__c',
																'Entite__c' : '',
																'risque_Entite__c' : '',
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