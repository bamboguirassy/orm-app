({
	refreshList : function(component, event) {
		var action = component.get("c.getImpacts");
        //action.setParam('risque', component.get('v.risque'));
        action.setParam('risque', component.get('v.risqueEntite').Risque__c);
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.impacts", response.getReturnValue());
            } else {
                alert("Echec de la recuperation des impacts");
            };

        });
        $A.enqueueAction(action);
	}
})