({
refreshList : function(component, event) {
		var action = component.get("c.findAllContentDocumentByMesure");
		action.setParams({
		'preuve':component.get('v.parentId')
		}); 
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
					component.set("v.items", response.getReturnValue());
				$A.enqueueAction(component.get('c.applyDatatable'));
				
			} 

		});
		$A.enqueueAction(action);
	}
 
})