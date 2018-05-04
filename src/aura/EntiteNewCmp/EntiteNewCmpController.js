({
    doInit: function(component, event, helper) {
        //helper.getFieldLabels(component, event);
        var action = component.get("c.findAll");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.entites", response.getReturnValue());
                var getFieldsLabelAction=component.get('c.getObjectFields');
        getFieldsLabelAction.setCallback(this, function(response){
            if(response.getState()=='SUCCESS'){
                component.set('v.clabels',response.getReturnValue()); 
                
            } else {
                    alert('Une erreur est survenues lors de la récuperation des champs'); }
        });
        $A.enqueueAction(getFieldsLabelAction);
            } else {
                alert("Echec de la recuperation des structures");
            };

        });
        $A.enqueueAction(action);

  

    },
    createItem: function(component, event, helper) {
        var nomField = component.find("nom");
        var phoneField = component.find("phone");
        var nom = nomField.get("v.value");
        var phone = phoneField.get('v.value');
        var isItemValid = true;
        if ($A.util.isEmpty(nom) || $A.util.isEmpty(phone)) {
            isItemValid = false;
            nomField.set("v.errors", [{
                message: "Le nom de l'entité ne peut etre vide."
            }]);
            component.set("v.isMissedValue", true);
        } else {
            nomField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            
            newItem.ParentId=component.find('entiteParentID').get("v.value");
            
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS") {
                    // publier evenement creation
                    var evt = $A.get("e.c:eventNewEntiteCreated");
                            evt.fire();
                

                    component.set("v.item",{
						'sobjectType' : 'Account',
						'Name':'',
						'Phone':'',
						'Website':'',
						'Description':'',
						'ParentId':''
						
					});
                }
            });
            $A.enqueueAction(action);

        } else {
           // alert("ajout échouée");
        }
        component.set("v.isOpen", false);
    },

})