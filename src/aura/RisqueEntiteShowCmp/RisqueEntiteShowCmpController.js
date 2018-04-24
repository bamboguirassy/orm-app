({
    navigateToEntiteShow: function(component, event, helper) {
        var evt = $A.get("e.c:navigateToEntiteShow");
        evt.setParams({
            "Id": component.get('v.item').Entite__c
        });
        evt.fire();
    },
    registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un risque
		var item = component.get('v.item');
		var evt = $A.get("e.c:eventEditRisqueEntiteClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	},
	confirmDeletion : function(component, event, helper) {

		var self = this; // safe reference

		itemToRemove = component.get('v.item');
		if (itemToRemove) {
			helper.showSpinner(component);
			var removeAction = component.get("c.remove");
			removeAction.setParam("item", itemToRemove);
			removeAction.setCallback(this, function(response) {
				var deleteState = response.getState();

				if (deleteState == "SUCCESS") {
					helper.hideSpinner(component);
					helper.closeDeleteConfirmationModel(component);
					helper.showToast('Success', itemToRemove.Name
							+ " supprimé avec succés ", 'success');
					var evt = $A.get("e.c:navigateToEntiteShow");
					evt.setParams({
						"Id" : component.get('v.item').Entite__c
					});
					evt.fire();
				} else {
					helper.showToast('Error', "Echec suppression "
							+ itemToRemove.Name, 'error');
				}

			});
			$A.enqueueAction(removeAction);
		} else {
			helper.showToast('Warning',
					"Aucun élement selectionné pour la suppression !",
					'warning');
		}
	},
	
    updateRisque: function(component, event, helper) {
        var item = component.get('v.item');
        item.etat__c = !item.etat__c;
        var action = component.get('c.add');
        action.setParams({
            "item": item
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS") {
                component.set("v.item", item);
            } else {
            alert("Le formulaire n'est pas valide");
            }
        });
        $A.enqueueAction(action);
    },
    navigateToRisqueShow : function(component, event, helper) {
		var evt = $A.get("e.c:navigateToRisqueShow");
		evt.setParams({
			"Id" : component.get('v.item').Risque__c
		});
		evt.fire();
	}

})