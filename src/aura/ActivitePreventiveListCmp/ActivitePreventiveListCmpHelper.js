({
	refreshList : function(component, event) {
		var action = component.get("c.findAll");
		if(component.get('v.planAction')!=null){
		action=component.get("c.findAllByPlanAction");
		action.setParams({
		//'planAction':component.get('v.planAction')
		'planAction':component.get('v.planAction').Id
		});
		
		}
		
				
		action
				.setCallback(
						this,
						function(response) {
							var state = response.getState();
							if (state == "SUCCESS") {
								component.set("v.items", response
										.getReturnValue());
							} else {
								alert("Impossible de recuperer la liste activités dans activités plan action");
							}

						});
		$A.enqueueAction(action);
	},
})