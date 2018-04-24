({
	refreshList : function(component, event) {
		var action = component.get("c.findAll");
		action
				.setCallback(
						this,
						function(response) {
							var state = response.getState();
							if (state == "SUCCESS") {
								component.set("v.items", response
										.getReturnValue());
							} else {
								alert("Impossible de recuperer la liste");
							}

						});
		$A.enqueueAction(action);
	}
})