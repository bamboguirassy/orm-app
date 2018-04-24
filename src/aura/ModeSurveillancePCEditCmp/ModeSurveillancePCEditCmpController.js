({
	
    editItem: function(component, event, helper) {
        var libelleField = component.find("libelle");
        var libelle = libelleField.get("v.value");
        var isItemValid = true;
        if ($A.util.isEmpty(libelle)) {
            isItemValid = false;
            libelleField.set("v.errors", [{
                message: "Le libelle ne peut etre vide."
            }]);
            alert('le libelle ne peut etre vide');
        } else {
            libelleField.set("v.errors", null);
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
                    // refresh list
                    // refresh list
                    var evt = $A.get("e.c:eventNewModeSurveillanceCreated");
                    evt.fire();
                    
                    /*var findAllAction = component.get("c.findFromPartieConcernee");
                    findAllAction.setParam("partieConcernee", newItem.PartieConcernee__c);
                    findAllAction.setCallback(this, function(response) {
                        var resStatus = response.getState();
                        if (resStatus == "SUCCESS") {
                            component.set("v.items", response.getReturnValue());
                        } else {
                            alert("impossible de recuperer la liste aprés ajout");
                        }
                    });
                    $A.enqueueAction(findAllAction); */

                    component.set("v.item", {
                        'sobjectType': 'ModeSurveillancePC__c',
                        'PartieConcernee__c': '',
                        'libelle__c': '',
                    });
                }
            });
            $A.enqueueAction(action);

        } else {
            alert("modification échouée");
        }
        component.set("v.isOpen", false);
    },

})