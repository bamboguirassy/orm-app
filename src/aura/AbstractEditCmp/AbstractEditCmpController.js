({
	doInit: function(component, event, helper) {
         helper.getFieldLabels(component, event);
    },
    closeModel : function(component, event, helper) {
		// for Hide/Close Model,set the "isOpen" attribute to "Fasle"
		component.set("v.isOpen", false);
	},
	
	openModal : function(component, event, helper) {
		// recuperer l'élément avec l'Id
		helper.openModal(component);
		var action = component.get('c.getElementById');
		action.setParam('Id', event.getParam('Id'));
		action.setCallback(this, function(response) {
			if (response.getState() == 'SUCCESS') {
				component.set('v.item', response.getReturnValue());
			} else {
				helper.showToast('Error', "Impossible de recuperer l'élement ",
						'error');
			}
		});
		$A.enqueueAction(action);
	}
})