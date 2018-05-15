({
    refreshList: function(component, event) {
        var action = component.get("c.findFromProcessus");
        action.setParam("processus", component.get('v.processus').Id);
        if (component.get('v.processus')) {
            action
                .setCallback(
                    this,
                    function(response) {
                        var state = response.getState();
                        if (state == "SUCCESS") {
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
                            $A.enqueueAction(component.get('c.applyDatatable'));
                        } else {
                            alert("Impossible de recuperer la liste des risques detectés");
                        }

                    });
            $A.enqueueAction(action);
        }
    }

})