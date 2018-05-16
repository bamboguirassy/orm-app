({
	refreshList : function(component, event) {
		var action = component.get('c.findAll');
		if(component.get('v.planAction')!=null){
		action=component.get("c.findAllByPlanAction");
		action.setParams({
		//'planAction':component.get('v.planAction')
		'planAction':component.get('v.planAction').Id
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
        $A.enqueueAction(action);
	}
})