({
	doInit : function(component, event, helper) {
		if ($A.util.isEmpty(component.get('v.items'))) {
			helper.refreshList(component, event);
		}
		
	},
	navigateToShow : function(component, event, helper) {
		var item = helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:navigateToProjetShow");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	},
	registerEdit : function(component, event, helper){
		// publions l'évènement de modification d'un projet
		var item = helper.getSelectedItem(component, event);
		var evt = $A.get('e.c:eventEditProjetClicked');
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})