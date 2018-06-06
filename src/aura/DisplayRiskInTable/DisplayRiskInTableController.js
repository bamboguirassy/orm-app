({
	doInit : function(component, event, helper) {
	    helper.getFieldLabels(component, event);
        var action = component.get('c.findAllByEntite');
		action.setParam("entite", component.get('v.entite'));
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
                 component.set('v.items', response.getReturnValue());
            }else{                
                alert('ERROR');
            }
        });
        $A.enqueueAction(action);
	}
})