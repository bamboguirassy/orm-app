({
	navigateToRisqueList: function(component, event, helper) {
        var evt = $A.get("e.c:navigateToRisqueList");
         evt.fire();
    },
    confirmDeletion : function(component, event, helper) {

		var self = this; // safe reference

		itemToRemove = component.get('v.item');
		//console.log("itemToRemove "+ JSON.stringify(itemToRemove));
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
					var evt = $A.get("e.c:navigateToRisqueList");
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
	registerEdit : function(component, event, helper){
		// deployer l'evenement qu'on veut modifier un risque
		var item = component.get("v.item");
		console.log("id "+ item.Id);
		
		var evt = $A.get("e.c:eventEditRisqueClicked");
		evt.setParams({
			"Id": item.Id
		});
		evt.fire();
	}
})