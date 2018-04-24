({
    
    registerEdit: function(component, event, helper) {
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditPlanActionClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
    },
    
    navigateToShow: function(component, event, helper) {
        var item = helper.getSelectedItem(component, event);
        var evt = $A.get("e.c:navigateToPlanActionShow");
        evt.setParams({
            "Id": item.Id
        });
        evt.fire();
    },
})