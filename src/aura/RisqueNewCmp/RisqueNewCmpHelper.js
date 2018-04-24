({
	refreshList : function(component, event) {
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
        $A.enqueueAction(action);


	}
})