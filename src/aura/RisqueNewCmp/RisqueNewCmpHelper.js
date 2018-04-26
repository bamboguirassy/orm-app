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
        
		var action = component.get('c.getCategorieRisques');
        action
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        component.set("v.categorieRisques", response
                            .getReturnValue());
                    } else {
                        alert("Impossible de recuperer la liste des catégories de risque");
                    }
        });
        $A.enqueueAction(getFieldsLabelAction);
        $A.enqueueAction(action);


	}
})