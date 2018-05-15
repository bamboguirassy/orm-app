({
	/*refreshList : function(component, event) {
	    //get clabels
	    var getFieldsLabelAction=component.get('c.getObjectFields');
        getFieldsLabelAction.setCallback(this, function(response){
            if(response.getState()=='SUCCESS'){
                component.set('v.clabels',response.getReturnValue()); 
                
            } else {
                    alert('Une erreur est survenues lors de la récuperation des champs'); }
        });
        
		var action = component.get("c.findAll");
		if(component.get('v.paramRisqueEntite')!=null ){
		action=component.get('c.findAllByParamRisqueEntite');
		action.setParams({
		  'paramRisqueEntite':component.get('v.paramRisqueEntite').Id
		});
		}
		
		action
				.setCallback(
						this,
						function(response) {
							var state = response.getState();
							if (state == "SUCCESS") {
								component.set("v.items", response
										.getReturnValue());
							} else {
								alert("Impossible de recuperer la liste des plans d'action dans plan d'action");
							}

						});
		$A.enqueueAction(getFieldsLabelAction);
		$A.enqueueAction(action);
	},*/
	 refreshList : function(component, event) {
	    //get clabels
	    var getFieldsLabelAction=component.get('c.getObjectFields');
        getFieldsLabelAction.setCallback(this, function(response){
            if(response.getState()=='SUCCESS'){
                component.set('v.clabels',response.getReturnValue()); 
                
            } else {
                    alert('Une erreur est survenues lors de la récuperation des champs'); }
        });
		var action = component.get('c.findAll');
		if(component.get('v.paramRisqueEntite')!=null ){
		action=component.get('c.findAllByParamRisqueEntite');
		action.setParams({
		  'paramRisqueEntite':component.get('v.paramRisqueEntite').Id
		});
		}
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
                var pageSize = component.get("v.pageSize");
                // hold all the records into an attribute named "items"
                component.set('v.items', response.getReturnValue());
                // get size of all the records and then hold into an attribute "totalRecords"
                component.set("v.totalRecords", component.get("v.items").length);
                // set star as 0
                component.set("v.startPage",0);
                
                component.set("v.endPage",pageSize-1);
                var PaginationList = [];
                for(var i=0; i< pageSize; i++){
                    if(component.get("v.items").length> i)
                        PaginationList.push(response.getReturnValue()[i]);    
                }
                component.set('v.PaginationList', PaginationList);
            }else{
                alert('ERROR');
            }
        });
        $A.enqueueAction(getFieldsLabelAction);
        $A.enqueueAction(action);
	}
})