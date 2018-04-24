({
    doSave: function(component, event, helper) {
        if (component.find("file").get("v.files").length > 0) {
            helper.save(component, event);
            
        } else {
            alert('Please Select a Valid File');
        }
    },
 
    handleFilesChange: function(component, event, helper) {
        var fileName = 'No File Selected..';
        if (event.getSource().get("v.files").length > 0) {
            fileName = event.getSource().get("v.files")[0]['name'];
        }
        component.set("v.fileName", fileName);
       
    },
    closeModelfileUploadCmp: function(component,event,helper){
	// for Hide/Close Model,set the "isOpen" attribute to "Fasle"
		component.set("v.isOpenfileUploadNewCmp", false);
	}
})