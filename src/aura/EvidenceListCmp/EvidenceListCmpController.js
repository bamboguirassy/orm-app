({
	doInit : function(component, event, helper) {
		if ($A.util.isEmpty(component.get('v.items'))) {
			helper.refreshList(component, event);
		}
		
	},
	showformfileUploadNew:function(component,event,helper){
	component.set('v.isOpenfileUploadNewCmp',true);
	var eltselected= helper.getSelectedItem(component,event);
	component.set('v.parentId',eltselected.Id);
},
showListfileByMesure : function(component,event,helper){
		component.set('v.isOpenListfileUploadCmp',true);
		var eltselected= helper.getSelectedItem(component,event);
		component.set('v.parentId',eltselected.Id);
   // deploiement de l'evenement
	var evt = $A.get("e.c:eventListFileUploadClicked");
    evt.setParams({
			"Id" : eltselected.Id
		});
  evt.fire();
}

})