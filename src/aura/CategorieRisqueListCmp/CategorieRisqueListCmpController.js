({
	refreshList : function(component, event, helper) {
		helper.refreshList(component, event);
	},

	registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un risque
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditCategorieRisqueClicked");
		evt.setParams({
			"Id" : item.Id,
		});
		evt.fire();
	}
	
})