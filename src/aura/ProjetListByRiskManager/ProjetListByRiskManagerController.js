({
	
	doInit : function(component, event, helper) {
	helper.getFieldLabels(component, event);
		if ($A.util.isEmpty(component.get('v.items'))) {
			helper.refreshList(component, event);
		}
		
	},
    navigateToShow : function(component, event, helper) {
		var item = helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:navigateToProjetShow");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})