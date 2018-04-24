({
	showformEvidenceNew:function(component,event,helper){
	component.set('v.isOpenEvidenceNewCmp',true);
	var eltselected= helper.getSelectedItem(component,event);
	component.set('v.mesure',eltselected.Id);
	
	},
	registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un impact
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditMesureActiviteClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	}
})