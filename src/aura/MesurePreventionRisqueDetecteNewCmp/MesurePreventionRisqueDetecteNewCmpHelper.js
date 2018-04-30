({
	refreshListMP : function(component, event) {
	
	     //get clabels
	    var getFieldsLabelAction=component.get('c.getObjectFields');
        getFieldsLabelAction.setCallback(this, function(response){
            if(response.getState()=='SUCCESS'){
                component.set('v.clabels',response.getReturnValue()); 
                
            } else {
                    alert('Une erreur est survenues lors de la récuperation des champs'); }
        });
		var action = component.get("c.getMesurePreventions");
        action.setParam('risque', component.get('v.paramRisqueEntite').risque__c);
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.mesurePreventions", response.getReturnValue());
                //alert(JSON.stringify(response.getReturnValue()));
            } else {
                alert("Echec de la recuperation des mesures de prévention");
            };

        });
        $A.enqueueAction(getFieldsLabelAction);
        $A.enqueueAction(action);
    }
})