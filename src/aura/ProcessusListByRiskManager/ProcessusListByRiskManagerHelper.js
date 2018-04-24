({
	refreshList : function(component, event) {
	
		var action = component.get("c.findAllByRiskManager");
		action.setParams({
			'idRiskManager': component.get('v.idRiskManager')
		});
		
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
					component.set("v.items", response.getReturnValue());				
			} else {
				alert("Une erreur est survenue lors de la récupération de la liste des processus");
			}
		});
		$A.enqueueAction(action);
	}
})