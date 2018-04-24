({

    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.ParamRisqueEntite__c = component.get('v.paramRisqueEntite').Id;


        if ($A.util.isEmpty(newItem.ParamRisqueEntite__c)) {
            alert("le ParamRisqueEntite ne peut être null, veuillez selectionner une valeur");
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // refresh list
                      var evt = $A.get("e.c:eventNewPREtrackerCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'PREtracker__c',
                        'description__c': '',
                        'valeur__c': '',
                        'ParamRisqueEntite__c': ''
                    });

                    //publish and Risque Detecté Event to create new Risque
                    var obj=response.getReturnValue();
                    var evt = $A.get("e.c:newRisqueDetecteEvt");
                    evt.setParams({
                        "sum": obj[0],
                        "preID": obj[1]
                    });
                    evt.fire();

                } else {
                    alert("Le formulaire n'est pas valide");
                }
            });
            $A.enqueueAction(action);
        }


        component.set("v.isOpen", false);
    },

})