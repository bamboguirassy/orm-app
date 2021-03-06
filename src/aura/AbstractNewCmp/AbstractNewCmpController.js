({
	doInit: function(component, event, helper) {
         helper.getFieldLabels(component, event);
    },
	openModel : function(component, event, helper) {
		// for Display Model,set the "isOpen" attribute to "true"
		component.set("v.isOpen", true);
	},

	closeModel : function(component, event, helper) {
		// for Hide/Close Model,set the "isOpen" attribute to "Fasle"
		component.set("v.isOpen", false);
	},
	closeAlertExistence: function(component, event, helper){
    	component.set("v.isDuplicateValueDetected", false);
    }
    ,
	closeAlertMissed: function(component, event, helper){
    	component.set("v.isMissedValue", false);
    }
})