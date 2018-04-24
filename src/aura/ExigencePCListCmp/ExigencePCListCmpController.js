({
	registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un impact
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditExigencePCClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})