({
		doInit : function(component, event, helper) {
		if ($A.util.isEmpty(component.get('v.items'))) {
			helper.refreshList(component, event);
		}
		
	},
	openSingleFile : function (component,event, helper){  
  var eltselected= helper.getSelectedItem(component,event);
          
        var fireEvent = $A.get("e.lightning:openFiles");
        fireEvent.fire({
            recordIds: [eltselected.Id]
        });      
    }
    
})