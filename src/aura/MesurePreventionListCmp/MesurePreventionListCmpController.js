({
  registerEdit: function(component, event, helper) {
 /*           var action = component.get("c.findUserEntites");
            action.setParam("entite", component.get('v.entite'));
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state == "SUCCESS") {
                    component.set("v.userEntites", response.getReturnValue());
                } else {
                    alert("Echec de la recuperation des utilisateurs dans la liste des plans d'action");
                };

            });
            $A.enqueueAction(action);*/
// deployer evenement qu'on veut modifier un plan d'action

		var item=helper.getSelectedItem(component, event);
		var evt = $A.get("e.c:eventEditMesurePreventionClicked");
		evt.setParams({
			"Id" : item.Id
		});
		evt.fire();
    }
})