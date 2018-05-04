({

    doInit: function(component, event, helper) {
    	helper.getFieldLabels(component, event);
    },
    createItem: function(component, event, helper) {

        var newItem = component.get("v.item");
        newItem.AccountId = component.get('v.entite').Id;


        if ($A.util.isEmpty(newItem.LastName)) {
            //alert("Le nom ne peut être null, veuillez selectionner une valeur");
            component.set("v.isMissedValue", true);
        } else {
            var action = component.get('c.add');
            action.setParams({
                "item": newItem
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state == "SUCCESS") {
                    // deploy evenement d'ajout
                    var evt = $A.get("e.c:eventNewRiskManagerCreated");
                            evt.fire();

                    component.set("v.item", {
                        'sobjectType': 'Contact',
                        'Birthdate': '',
                        'Description': '',
                        'Email': '',
                        'FirstName': '',
                        'LastName': '',
                        'Phone': '',
                        'PhotoUrl': '',
                    });
                } else {
                    alert("L'ajout du gestionnaire a échoué");
                }
            });
            $A.enqueueAction(action);
        }


        component.set("v.isOpen", false);
    },
        handleFilesChange: function(component, event, helper) {
        var fileName = 'No File Selected..';
        if (event.getSource().get("v.files").length > 0) {
            fileName = event.getSource().get("v.files")[0]['name'];
              var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            var template = component.get("v.richtextvalue");
            if(template===undefined) template = '';
            template += '<img src="'+reader.result+'"/>';
            component.set("v.richtextvalue",template);
        };
        reader.onerror = function (error) {
            console.log('Error: ', error);
        };
        }
        component.set("v.fileName", fileName);
       
    }
   
})