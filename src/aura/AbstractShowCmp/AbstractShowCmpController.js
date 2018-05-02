({
	doInit : function(component, event, helper) {
	//get clabels
	helper.getFieldLabels(component, event);
	
		var action = component.get('c.getElementById');
		action.setParam("Id", component.get('v.Id'));
		helper.showSpinner(component);
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == 'SUCCESS') {
			    alert(JSON.stringify(response.getReturnValue()))
				component.set("v.item", response.getReturnValue());
				helper.hideSpinner(component);
			} else {
				helper
						.showToast('Error',
								"Erreur lors de la reccuperation de l'élement",
								"error")

			}
		});
		$A.enqueueAction(action);

	},
	removeItem : function(component, event, helper) {
		helper.openDeleteConfirmationModel(component);

	},
	confirmDeletion : function(component, event, helper) {
			var cc = component.getConcreteComponent();
			//appel la méthode du  controller cient du composant concret 
			var removeAction = cc.get("c.confirmDeletion");
			$A.enqueueAction(removeAction);
	},
	closeDeleteConfirmationModel : function(component, event, helper) {
		helper.closeDeleteConfirmationModel(component);
		// cacher le spinner
		helper.hideSpinner(component);
	},
	refreshShow : function(component, event,helper){
		var action = component.get('c.getElementById');
		action.setParam("Id", component.get('v.Id'));
		helper.showSpinner(component);
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == 'SUCCESS') {
				component.set("v.item", response.getReturnValue());
				helper.hideSpinner(component);
			} else {
				helper
						.showToast('Error',
								"Erreur lors de la reccuperation de l'élement",
								"error")

			}
		});
		$A.enqueueAction(action);
	}

})