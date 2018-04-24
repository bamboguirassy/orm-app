({
	 navigateToProcessusShow: function(component, event, helper) {
        var evt = $A.get("e.c:navigateToProcessusShow");
        evt.setParams({
            "Id": component.get('v.item').processus__c
        });
        evt.fire();
    },
    registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un risque
		var item = component.get('v.item');
		var evt = $A.get("e.c:eventEditPartieConcerneeClicked");
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
					var evt = $A.get("e.c:navigateToProcessusShow");
					evt.setParams({
						 "Id": component.get('v.item').processus__c
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
})