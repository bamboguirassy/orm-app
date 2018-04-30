({
	helperMethod : function() {
		
	},
	getFieldLabels: function(component, event){
        var getFieldsLabelAction=component.get('c.getObjectFields');
        getFieldsLabelAction.setCallback(this, function(response){
            if(response.getState()=='SUCCESS'){
                component.set('v.clabels',response.getReturnValue());                
            } else {
                    alert('Une erreur est survenues lors de la récuperation des champs'); }
        });
        $A.enqueueAction(getFieldsLabelAction);
    },
    showFilePreview: function(component, fileId) {
		$A.get('e.lightning:openFiles').fire({
			recordIds: [fileId]
		});
	},
	showSpinner: function(component) {
        var spinner = component.find('spinner-div');
        $A.util.removeClass(spinner, "slds-hide");
    },

    hideSpinner: function(component) {
        var spinner = component.find('spinner-div');
        $A.util.addClass(spinner, "slds-hide");
	},

	showToast: function(title, message, type) {
		console.log('## PHASE ACTION - SHOW TOAST');
		var toastEvent = $A.get('e.force:showToast');

	    toastEvent.setParams({
	        'title': title,
	        'message': message,
	        'type': type,
	        'mode': 'dismissible'
	    });

	    toastEvent.fire();
	},
	initFileUpload: function(component) {
		console.log('## PHASE ACTION - INIT FILE UPLOAD');
		this.hideSpinner(component);
		component.set('v.showFileUpload', true);
	},
	openModal : function(component) {
		// for Hide/Close Model,set the "isOpen" attribute to "Fasle"
		component.set("v.isOpen", true);
	},
	closeModel : function(component) {
		// for Hide/Close Model,set the "isOpen" attribute to "Fasle"
		component.set("v.isOpen", false);
	},
})