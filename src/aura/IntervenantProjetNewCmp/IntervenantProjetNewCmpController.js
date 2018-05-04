({
	doInit: function(component, event, helper) {
		helper.getFieldLabels(component, event);
	    var action = component.get('c.getIntervenants');
	    action.setParams({'structureId': component.get('v.projet').Structure__c});
	    action
	        .setCallback(
	            this,
	            function(response) {
	                var state = response.getState();
	                if (state == "SUCCESS") {
	                    component.set("v.intervenants", response
	                        .getReturnValue());
	                } else {
	                    helper.showToast("ERREUR","Impossible de recuperer la liste des intervenants","error");
	                }
	            });
	    $A.enqueueAction(action);
},
createItem: function(component, event, helper) {
    var roleField = component.find("role");
    var role = roleField.get("v.value");
    var isItemValid = true;
    if ($A.util.isEmpty(role)) {
        isItemValid = false;
        roleField.set("v.errors", [{
            message: "Le role ne peut etre vide."
        }]);
        component.set("v.isMissedValue", true);
        //helper.showToast('erreur','le role ne peut etre vide', 'error');
    } else {
        roleField.set("v.errors", null);
    }
    if (isItemValid) {
        var newItem = component.get("v.item");
        newItem.Intervenant__c = component.find("intervenantId").get("v.value");
        newItem.Project__c = component.get("v.projet").Id;
        var action = component.get('c.add');
        action.setParams({
            "item": newItem
        });
        action
            .setCallback(
                this,
                function(response) {
                    var state = response.getState();
                    if (state == "SUCCESS") {
                        var evt = $A.get("e.c:eventNewIntervenantProjetCreated");
                        evt.fire();

                        component.set("v.item", {
                            'sobjectType': 'IntervenantProjet__c',
                            'Name': '',
                            'description__c': ''
                        });
                    }
                });
        $A.enqueueAction(action);

    } else {
        alert("ajout échouée");
    }
    component.set("v.isOpen", false);
    },
})