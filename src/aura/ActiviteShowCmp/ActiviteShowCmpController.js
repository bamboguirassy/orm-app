({
	 navigateToPlanActionShow: function(component, event, helper) {
        var evt = $A.get("e.c:navigateToPlanActionShow");
        evt.setParams({
            "Id": component.get('v.item').plan_Action__c
        });
        evt.fire();
    },
})