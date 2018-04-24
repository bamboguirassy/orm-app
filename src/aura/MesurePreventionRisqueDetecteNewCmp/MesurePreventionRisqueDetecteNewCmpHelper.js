({
	refreshListMP : function(component, event) {
		var action = component.get("c.getMesurePreventions");
        action.setParam('risque', component.get('v.risque'));
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.mesurePreventions", response.getReturnValue());
                //alert(JSON.stringify(response.getReturnValue()));
            } else {
                alert("Echec de la recuperation des mesures de prévention");
            };

        });
        $A.enqueueAction(action);
    }
})