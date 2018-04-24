({
	refreshList: function(component, event, helper) {
		helper.refreshList(component, event);
	},
	registerEdit: function(component, event, helper){
		//publions l'éveènement de modification
		var item = helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditCategorieImpactClicked");
		evt.setParams({
			'Id': item.Id
		});
		evt.fire();		
	}
})