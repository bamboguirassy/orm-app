({

	createItem : function(component, event, helper) {
		
		
		var newItem = component.get("v.item");
		newItem.PartieConcernee__c = component.get('v.partieConcernee').Id;

		if ($A.util.isEmpty(newItem.Name)) {
			alert("le libellé ne peut être null, veuillez selectionner une valeur");
		} else {
			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});
			action.setCallback(this, function(response) {
				var state = response.getState();
				if (state == "SUCCESS") {
					// publier événement ajout
					var evt = $A.get("e.c:eventNewCritereEfficaciteCreated");
					evt.fire();
					// vider le formulaire
					component.set("v.item", {
						'sobjectType' : 'CritereEfficacitePC__c',
						'PartieConcernee__c' : '',
						'Name' : '',
					});
				} else {
					alert("L'ajout a échoué");
				}
			});
			$A.enqueueAction(action);
		}

		component.set("v.isOpen", false);
	},

})