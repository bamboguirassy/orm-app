({
	doInit : function(component, event, helper) {
		if ($A.util.isEmpty(component.get('v.items'))) {
			helper.refreshList(component, event);
		}
		
	},
	
	  closeModelListfileUploadCmp: function(component,event,helper){
	// for Hide/Close Model,set the "isOpen" attribute to "Fasle"
		component.set("v.isOpenListfileUploadCmp", false);
	},
openSingleFile : function (component,event, helper){  
  var eltselected= helper.getSelectedItem(component,event);
          
        var fireEvent = $A.get("e.lightning:openFiles");
        fireEvent.fire({
            recordIds: [eltselected.Id]
        });      
    }

})