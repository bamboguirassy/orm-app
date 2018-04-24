({

	navigateToShow : function(component, event, helper) {
		var item = helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:navigateToActivitePreventiveShow");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	},
	registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un risque
		var item = helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditActiviteClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})