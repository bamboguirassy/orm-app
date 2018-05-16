({
     refreshList : function(component, event) {
		var action = component.get("c.findAllContentDocument");
		action.setParams({
		'activite':component.get('v.activite')
		});
		
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
				var pageSize = component.get("v.pageSize");
                // hold all the records into an attribute named "items"
                component.set('v.items', response.getReturnValue());
                // get size of all the records and then hold into an attribute "totalRecords"
                component.set("v.totalRecords", component.get("v.items").length);
                // set star as 0
                component.set("v.startPage",0);
                var totalRecords = component
				.get("v.items").length;
			    //var div = Math.trunc(totalRecords / pageSize);
                if(totalRecords === pageSize){
                  component.set("v.hideNext", true);
                  component.set("v.endPage", pageSize - 1);
                  
                }else{
                  component.set("v.hideNext", false);
                  component.set("v.endPage", pageSize - 1);
                  
                }
                var PaginationList = [];
                for(var i=0; i< pageSize; i++){
                    if(component.get("v.items").length> i)
                        PaginationList.push(response.getReturnValue()[i]);    
                }
                component.set('v.PaginationList', PaginationList);
				
			} else {
				alert("Une erreur est survenue lors de la récupération de la liste des pieces jointes");
			}

		});
		$A.enqueueAction(action);
	}

})