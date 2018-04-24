({
	refreshList : function(component, event) {
		var action = component.get("c.findAll");
		if(component.get('v.paramRisqueEntite')!=null ){
		action=component.get('c.findAllByParamRisqueEntite');
		action.setParams({
		  'paramRisqueEntite':component.get('v.paramRisqueEntite').Id
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
								alert("Impossible de recuperer la liste des plans d'action dans plan d'action");
							}

						});
		$A.enqueueAction(action);
	},
})