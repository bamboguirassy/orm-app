({
    doInit: function(component, event, helper) {
        helper.refreshList(component, event);
        helper.getFieldLabels(component, event);
    },
    registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un risque
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditElementSortieClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})