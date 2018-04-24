({
	navigateToShow: function(component, event, helper) {
        var item = helper.getSelectedItem(component, event);
        var evt = $A.get("e.c:navigateToProcessusShow");
        evt.setParams({
            "Id": item.Id
        });
        evt.fire();
    },
    registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un impact
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditProcessusClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})