({
	doInit : function(component, event, helper) {
		var action1 = component.get('c.getUser');
		action1.setCallback(this, function(response) {
			if (response.getState() == 'SUCCESS') {
				component.set('v.user', response.getReturnValue());
			} else {
				alert("Impossible de réccuperer l'utilisateur");
			}
		});
			$A.enqueueAction(action1);

		var action2 = component.get('c.getProfile');
		action2.setCallback(this, function(response) {
			if (response.getState() == 'SUCCESS') {
				component.set('v.profile', response.getReturnValue());
			} else {
				alert("Impossible de réccuperer le profile de l'utilisateur");
			}
		});
			$A.enqueueAction(action2);
			
			

	},
	
})