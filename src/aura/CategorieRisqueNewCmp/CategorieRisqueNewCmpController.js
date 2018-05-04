({
	createItem : function(component, event, helper) {
		var nomField = component.find("nom");
		var nom = nomField.get("v.value");
		var isItemValid = true;
		if ($A.util.isEmpty(nom)) {
			isItemValid = false;
			nomField.set("v.errors", [ {
				message : "Le nom de la catégorie ne peut etre vide."
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
					// refresh list
					var evt = $A.get("e.c:eventNewCategorieRisqueCreated");
					evt.fire();
					/*
					 * var findAllAction=component.get("c.findAll");
					 * findAllAction.setCallback(this, function(response){ var
					 * resStatus=response.getState(); if(resStatus=="SUCCESS"){
					 * component.set("v.items", response.getReturnValue()); }
					 * else { alert("impossible de recuperer la liste aprés
					 * ajout"); } }); $A.enqueueAction(findAllAction);
					 */

					component.set("v.item", {
						'sobjectType' : 'Categorie_Risque__c',
						'Name' : '',
						'Description__c' : '',
						'categorieRisque__c' : '',
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

	showNewCategorieRisque : function(component, event, helper) {
		component.set("v.isOpen", true);
	}

})