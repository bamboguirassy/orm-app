({	
	refreshList: function(component, event, helper){
		helper.refreshList(component, event);
	},
	registerEdit : function(component, event, helper) {		
		// deployer evenement qu'on veut modifier un mode de surveillance
		var item=helper.getSelectedItem(component, event);
		console.log("id", item.Id);
		var evt = $A.get("e.c:eventEditModeSurveillanceClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})