({
	doInit : function(component, event, helper) {
		helper.refreshList(component, event);
	},
	navigateToShow: function(component, event, helper) {
        var item = helper.getSelectedItem(component, event);
        var evt = $A.get("e.c:navigateToProcessusShow");
        evt.setParams({
            "Id": item.Id
        });
        evt.fire();
    }
})