({
	refreshList : function(component, event) {
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
        $A.enqueueAction(action);
	}
})