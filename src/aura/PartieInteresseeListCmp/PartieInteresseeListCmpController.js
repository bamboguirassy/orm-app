({
   registerEdit : function(component, event, helper) {	    
		// deployer evenement qu'on veut modifier un risque
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditPartieInteresseeClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();		
	}
})