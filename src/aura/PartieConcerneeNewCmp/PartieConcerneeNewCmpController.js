({

	createItem : function(component, event, helper) {

		var newItem = component.get("v.item");
		newItem.processus__c = component.get('v.processus').Id;

		if ($A.util.isEmpty(newItem.Name)) {
			alert("le libellé ne peut être null, veuillez selectionner une valeur");
		} else {

			var partieConcerneExistantes = component.get("v.items");

			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});
			action.setCallback(this, function(response) {
				var state = response.getState();
				if (component.isValid() && state == "SUCCESS") {
					// refresh list
					var evt = $A.get("e.c:eventNewPartieConcerneeCreated");
					evt.fire();

					component.set("v.item", {
						'sobjectType' : 'PartieConcernee__c',
						'processus__c' : '',
						'Name' : '',
					});
				} else {
					alert("Le formulaire n'est pas valide");
				}
			});
			$A.enqueueAction(action);
		}

		component.set("v.isOpen", false);
	},

})