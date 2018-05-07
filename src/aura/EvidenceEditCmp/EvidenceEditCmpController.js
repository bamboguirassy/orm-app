({
	openModaledit : function(component, event, helper) {
		// recuperer l'élément avec l'Id
		helper.openModal(component);
		var action = component.get('c.getElementByIdPreuve');
		action.setParam('Id', event.getParam('Id'));
		action.setCallback(this, function(response) {
			if (response.getState() == 'SUCCESS') {
				component.set('v.item', response.getReturnValue());
			} else {
				helper.showToast('Error', "Impossible de recuperer l'élement ",
						'error');
			}
		});
		$A.enqueueAction(action);
	},
	 closeModaledit : function(component, event, helper) {
		// for Hide/Close Model,set the "isOpen" attribute to "False"
		component.set("v.isOpenEditmodal", false);
	},
    editItem: function(component, event, helper) {
      	var nomField = component.find("nom");
		var nom = nomField.get("v.value");
		
		var isItemValid = true;
		if ($A.util.isEmpty(nom)) {
			isItemValid = false;
			nomField
					.set(
							"v.errors",
							[ {
								message : "Le nom ne peut etre vide."
							} ]);
			alert( "Le nom ne peut etre vide");
		} else {
			nomField.set("v.errors", null);
		}
        if (isItemValid) {
            var newItem = component.get("v.item");

            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    var evt = $A.get("e.c:eventNewPreuveCreated");
					evt.fire();
                   component.set("v.item", {
										'sobjectType' : 'Evidence__c',
						'Name' : '',
						'description__c' : '',
						'evidenceOfActivity__c': '',
						'webRessource__c' : ''
									});
                }
            });
            $A.enqueueAction(action);

        } else {
            alert("modification échouée");
        }
        component.set("v.isOpenEditmodal", false);
    }
 
})