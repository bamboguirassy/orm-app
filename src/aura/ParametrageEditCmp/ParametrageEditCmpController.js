({
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
			var action = component.get('c.addParametrage');
			action.setParams({
				"item" : newItem
			});
			action.setCallback(this, function(response) {
				var state = response.getState();
				if (component.isValid() && state == "SUCCESS") {
				
				
					component.set("v.item", response.getReturnValue());
					
					component.set("v.isOpen", false);
				}
			});
			$A.enqueueAction(action);

		} else {
			alert("modification échouée");
		}
		
	},

})