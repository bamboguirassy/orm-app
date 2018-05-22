({
	navigateToParent : function(component, event, helper) {
		var evt = $A.get("e.c:navigateToParamRisqueEntiteShow");
		evt.setParams({
			"Id" : component.get('v.item').ParamRisqueEntite__c
		});
		evt.fire();
	},
	navigateToParent : function(component, event, helper) {
		var evt = $A.get("e.c:navigateToEntiteShow");
		evt.setParams({
			"Id" : component.get('v.item').entite__c
		});
		evt.fire();
	},
	registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un risque
		var item = component.get('v.item');
		var evt = $A.get("e.c:eventEditParamRisqueEntiteClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	},
	confirmDeletion : function(component, event, helper) {

		var self = this; // safe reference

		itemToRemove = component.get('v.item');
		if (itemToRemove) {
			helper.showSpinner(component);
			var removeAction = component.get("c.remove");
			removeAction.setParam("item", itemToRemove);
			removeAction.setCallback(this, function(response) {
				var deleteState = response.getState();

				if (deleteState == "SUCCESS") {
					helper.hideSpinner(component);
					helper.closeDeleteConfirmationModel(component);
					helper.showToast('Success', itemToRemove.Name
							+ " supprimé avec succés ", 'success');
					var evt = $A.get("e.c:navigateToEntiteShow");
					evt.setParams({
						"Id" : component.get('v.item').entite__c
					});
					evt.fire();
				} else {
					helper.showToast('Error', "Echec suppression "
							+ itemToRemove.Name, 'error');
				}

			});
			$A.enqueueAction(removeAction);
		} else {
			helper.showToast('Warning',
					"Aucun élement selectionné pour la suppression !",
					'warning');
		}
	},
	createNewRisqueByEvent: function(component, event, helper) {
        //recuperer l'element ParamRisqueEntite par son Id
        var action = component.get('c.getParamRisqueEntite');
        action.setParam("Id", event.getParam("preID"));
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {

                var pre = response.getReturnValue();
                if (event.getParam("sum") >= pre.seuilApparution__c) {
                	alert();
                    var today = new Date();
                    var monthDigit = today.getMonth() + 1;
                    if (monthDigit <= 9) {
                        monthDigit = '0' + monthDigit;
                    }
                    component.set("v.editItem", {
                        'sobjectType': 'Risque_Entite__c',
                        'Date_Detection__c': today.getFullYear() + "-" + monthDigit + "-" + today.getDate(),
                        'Risque__c': pre.risque__c,
                    });
                    component.set("v.editComponentIsOpen", true);
                }
            } else {
            helper.showToast('Error',"impossible de récuperer l\'élement à partir de son ID",'Error');
            helper.showToast('Error',action.getError(),"error");
            }
        });
        $A.enqueueAction(action);

        //alert(event.getParam('sum') + ' ' + event.getParam('preID'));
    },
	
})