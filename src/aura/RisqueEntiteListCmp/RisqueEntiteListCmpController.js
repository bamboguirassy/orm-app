({
    navigateToShow: function(component, event, helper) {
        var item = helper.getSelectedItem(component, event);
        var evt = $A.get("e.c:navigateToRisqueEntiteShow");
        evt.setParams({
            "Id": item.Id
        });
        evt.fire();
    },
    registerEdit : function(component, event, helper) {
		// deployer evenement qu'on veut modifier un impact
		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditRisqueEntiteClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
	},
    createNewRisqueByEvent: function(component, event, helper) {
        //recuperer l'element ParamRisqueEntite par son Id
        var action = component.get('c.getParamRisqueEntite');
        action.setParam("Id", event.getParam("preID"));
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {

                var pre = response.getReturnValue();
                if (event.getParam("sum") >= pre.seuilApparution__c) {
                
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