({
	doInit : function(component, event, helper) {
		var action = component.get("c.findAll");
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
				component.set("v.entites", response.getReturnValue());
			} else {
				alert("Echec de la recuperation des entites");
			}
			;

		});
		$A.enqueueAction(action);
	},
	editItem : function(component, event, helper) {
	
		var nomField = component.find("nom");
		var nom = nomField.get("v.value");
		var phoneField = component.find("phone");
		var phone = phoneField.get('v.value');
		var isItemValid = true;
		if ($A.util.isEmpty(nom)) {
			isItemValid = false;
			nomField.set("v.errors", [ {
				message : "Le nom de la structure ne peut etre vide."
			} ]);
		} else {
			nomField.set("v.errors", null);
		}
		if (isItemValid) {
		
			var newItem = component.get("v.item");
			newItem.ParentId = component.find('parentID').get("v.value");
//			newItem.Description = component.find('description').get("v.value");

			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});
			action.setCallback(this, function(response) {
				var state = response.getState();
				if (component.isValid() && state == "SUCCESS") {
				
				//deploy event
					var evt = $A.get("e.c:eventNewEntiteCreated");
					evt.fire();
					component.set("v.item", {
						'sobjectType' : 'Account',
						'Name' : '',
						'Phone' : '',
						'Website' : '',
						'Description' : '',
						'ParentId' : ''

					});

				}
			});
			$A.enqueueAction(action);

		} else {
			alert("modification échouée");
		}
		component.set("v.isOpen", false);
	}

})