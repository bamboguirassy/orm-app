({
	doInit : function(component, event, helper) {
		var action = component.get('c.getCategorieRisques');
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
				component.set("v.categorieRisques", response.getReturnValue());
			} else {
				alert("Impossible de recuperer la liste des risques");
			}
		});
		$A.enqueueAction(action);

	},
	editItem : function(component, event, helper) {
		var nomField = component.find("nom");
		var nom = nomField.get("v.value");
		var isItemValid = true;
		if ($A.util.isEmpty(nom)) {
			isItemValid = false;
			nomField.set("v.errors", [ {
				message : "Le nom ne peut etre vide."
			} ]);
		} else {
			nomField.set("v.errors", null);
		}
		if (isItemValid) {
			var newItem = component.get("v.item");
			newItem.categorieRisque__c = component.find("categorieRisqueId")
					.get("v.value");

			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});
			action.setCallback(this, function(response) {
				var state = response.getState();
				if (component.isValid() && state == "SUCCESS") {
					// deploy add event
					var evt = $A.get("e.c:eventNewRisqueCreated");
					evt.fire();
					component.set("v.item", {
						'sobjectType' : 'Risque__c',
						'Name' : '',
						'Description__c' : ''
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