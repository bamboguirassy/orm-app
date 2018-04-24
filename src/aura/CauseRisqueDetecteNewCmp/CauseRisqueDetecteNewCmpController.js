({
    
    createItem: function(component, event, helper) {
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
            newItem.risqueEntite__c = component.get('v.risqueEntite');
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
                            // refresh list
                            var evt = $A.get("e.c:eventNewCauseRisqueDetecteCreated");
                            evt.fire();
                            /*var findAllAction = component
                                .get("c.findAll");
                            findAllAction.setParams({
                                'risqueEntite': component.get('v.risqueEntite')
                            });
                            findAllAction
                                .setCallback(
                                    this,
                                    function(response) {
                                        var resStatus = response
                                            .getState();
                                        if (resStatus == "SUCCESS") {
                                            component
                                                .set(
                                                    "v.items",
                                                    response
                                                    .getReturnValue());
                                        } else {
                                            alert("impossible de recuperer la liste aprés ajout");
                                        }
                                    });
                            $A.enqueueAction(findAllAction);*/

                            component.set("v.item", {
                                'sobjectType': 'CauseRisqueDetecte__c',
                                'Name': '',
                                'Description__c': ''
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