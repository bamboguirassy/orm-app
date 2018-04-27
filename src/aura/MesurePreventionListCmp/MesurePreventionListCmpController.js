({
  registerEdit: function(component, event, helper) {
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditMesurePreventionClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
    }
})