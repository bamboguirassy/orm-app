({
	refreshList : function(component, event) {
		var action = component.get("c.findAll");
		if(component.get('v.entite')!=null ){
		action=component.get('c.findAllByEntite');
			action.setParam("entite", component.get('v.entite'));
		}
		action
				.setCallback(
						this,
						function(response) {
							var state = response.getState();
							if (state == "SUCCESS") {
								component.set("v.items", response
										.getReturnValue());
										$A.enqueueAction(component.get('c.applyDatatable'));
							} else {
								alert("Impossible de recuperer la liste des risques entités dans risque entité list");
							}

						});
		$A.enqueueAction(action);
	}
})