({
    navigateToShow: function(component, event, helper) {
    	
        var item = helper.getSelectedItem(component, event);
        var evt = $A.get("e.c:navigateToRiskManagerShow");
        evt.setParams({
            "Id": item.Id
        });
        evt.fire();
          component.set("v.recordId", item.Id);
    },
    registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un risque
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditRiskManagerClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})