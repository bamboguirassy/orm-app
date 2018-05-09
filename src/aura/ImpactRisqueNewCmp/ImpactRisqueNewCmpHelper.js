({
	refreshList : function(component, event) {
	    //get clabels
	    var getFieldsLabelAction=component.get('c.getObjectFields');
        getFieldsLabelAction.setCallback(this, function(response){
            if(response.getState()=='SUCCESS'){
                component.set('v.clabels',response.getReturnValue()); 
                
            } else {
                    alert('Une erreur est survenues lors de la récuperation des champs'); }
        });
	
		var action = component.get('c.getCategorieImpacts');
        action
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        component.set("v.categorieImpacts", response
                            .getReturnValue());
                    } else {
                        alert("Impossible de recuperer la liste des catégories d'impact");
                    }
                });
        $A.enqueueAction(getFieldsLabelAction);        
        $A.enqueueAction(action);
	}
})