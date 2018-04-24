({
refreshList : function(component, event) {
		var action = component.get("c.findAllContentDocument");
		action.setParams({
		'activite':component.get('v.activite')
		});
		
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
					component.set("v.items", response.getReturnValue());
//				$A.enqueueAction(component.get('c.applyDatatable'));
				
			} else {
				alert("Une erreur est survenue lors de la récupération de la liste des pieces jointes");
			}

		});
		$A.enqueueAction(action);
	}

})