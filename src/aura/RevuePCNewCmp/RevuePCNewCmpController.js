({
    
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.PartieConcernee__c = component.get('v.partieConcernee').Id;


        if ($A.util.isEmpty(newItem.Name)) {
            alert("le libellé ne peut être null, veuillez selectionner une valeur");
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // refresh list
                    var evt = $A.get("e.c:eventNewRevuePCCreated");
                    evt.fire();
                    /*var findAllAction = component.get("c.findFromPartieConcernee");
                    findAllAction.setParam("partieConcernee", component.get('v.partieConcernee').Id);
                    findAllAction.setCallback(this, function(response) {
                        var resStatus = response.getState();
                        if (resStatus == "SUCCESS") {
                            component.set("v.items", response.getReturnValue());
                        } else {
                            alert("impossible de recuperer la liste aprés ajout");
                        }
                    });
                    $A.enqueueAction(findAllAction);*/

                    component.set("v.item", {
                        'sobjectType': 'RevuePC__c',
                        'PartieConcernee__c': '',
                        'Name': '',
                    });
                } else {
                alert("Le formulaire n'est pas valide");
                }
            });
            $A.enqueueAction(action);
        }


        component.set("v.isOpen", false);
    },

})