({
	createItem : function(component, event, helper) {
		var nomField = component.find("nom");
		var nom = nomField.get("v.value");
		var isItemValid = true;
		if ($A.util.isEmpty(nom)) {
			isItemValid = false;
			nomField.set("v.errors", [ {
				message : ""+ component.get("v.alertMessage")
			} ]);
			//component.set("v.isMissedValue", true);
		} else {
			nomField.set("v.errors", null);
		
		if (isItemValid) {
			var newItem = component.get("v.item");
			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});
			action.setCallback(this, function(response) {
				var state = response.getState();
				if (component.isValid() && state == "SUCCESS") {
				//refresh list
				var evt = $A.get("e.c:eventNewCategorieMesurePreventioCreated");
                            evt.fire();
				
					component.set("v.item", {
						'sobjectType' : 'Categorie_Mesure_Prevention__c',
						'Name' : '',
						'Description__c' : ''
					});
				}
			});
			$A.enqueueAction(action);

		} else {
			alert("ajout échouée");
		}
		component.set("v.isOpen", false);
		}
	},

})