({
doInit : function(component, event, helper) {

		var action = component.get('c.findAll');
		 action.setParams({
                                'mesure': component
                                    .get('v.mesure')
                            });
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state = 'SUCCESS') {
// component.set("v.entites", response.getReturnValue());
			} else {
				alert('Impossible de récupérer la liste des structures');
			}
		});
		$A.enqueueAction(action);
		helper.getFieldLabels(component, event);

	},

	createItem : function(component, event, helper) {
		var nomField = component.find("nom");
		var nom = nomField.get("v.value");
		
		var isItemValid = true;
		if ($A.util.isEmpty(nom)) {
			isItemValid = false;
			nomField
					.set(
							"v.errors",
							[ {
								message : "Le nom ne peut etre vide."
							} ]);
			alert( "Le nom ne peut etre vide");
		} else {
			nomField.set("v.errors", null);
		}
		if (isItemValid) {
			var newItem = component.get("v.item");
			newItem.evidenceOfActivity__c = component.get('v.mesure');
			
			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});
			
			action
					.setCallback(
							this,
							function(response) {
								var state = response.getState();
								if (state == "SUCCESS") {
							
								// deploiement de l'evenement
									var evt = $A.get("e.c:eventNewPreuveCreated");
                            evt.fire();
                            helper.showToast('succes','Ajout Preuve reussi','success');
                           
									component.set("v.item", {
										'sobjectType' : 'Evidence__c',
						'Name' : '',
						'description__c' : '',
						'evidenceOfActivity__c': '',
						'webRessource__c' : ''
									});
								}
							});
			$A.enqueueAction(action);

		} else {
			alert("ajout échouée");
		}
		component.set("v.isOpenEvidenceNewCmp", false);

	},
	closeModelEvidenceNewCmp: function(component,event,helper){
	// for Hide/Close Model,set the "isOpen" attribute to "Fasle"
		component.set("v.isOpenEvidenceNewCmp", false);
	}
})