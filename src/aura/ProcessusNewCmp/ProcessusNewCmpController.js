({
    doInit: function(component, event, helper) {
    	 helper.getFieldLabels(component, event);
        // find entites
        var action1 = component.get('c.getEntites');
        action1.setCallback(this, function(response) {
            if (response.getState() == 'SUCCESS') {
                component.set('v.entites', response.getReturnValue());
            } else {
                alert('Impossible de récuperer la liste des entités');
            }
        });
        $A.enqueueAction(action1);
    },

    createItem: function(component, event, helper) {
        var nomField = component.find("intitule");
        var nom = nomField.get("v.value");
        var versionField = component.find("version");
        var version = versionField.get("v.value");
        var dateApplicationField = component.find("dateApplication");
        var dateApplication = dateApplicationField.get("v.value");
        var piloteID = component.find("piloteID").get("v.value");
        var copiloteID = component.find("copiloteID").get("v.value");
        var proprietaire=component.find('proprietaireID').get('v.value');
        var isItemValid = true;
        if ($A.util.isEmpty(nom) || $A.util.isEmpty(version) ||
            $A.util.isEmpty(dateApplication) ||
            $A.util.isEmpty(piloteID)) {
            isItemValid = false;
            nomField
                .set(
                    "v.errors", [{
                        message: "Le nom,la version, le pilote et la date d'application ne peuvent etre vides."
                    }]);
            alert("Le nom,la version et la date d'application ne peuvent etre vides.");
        } else {
            nomField.set("v.errors", null);
        }
        if (isItemValid) {
            var newItem = component.get("v.item");
            newItem.pilote__c = piloteID;
            newItem.copilote__c = copiloteID;
            newItem.proprietaire__c =proprietaire;
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
                          var evt = $A.get("e.c:eventNewProcessusCreated");
                            evt.fire();

                            component.set("v.item", {
                                'sobjectType': 'Processus__c',
                                'copilote__c': '',
                                'dateApplication__c': '',
                                'finalite__c': '',
                                'Name': '',
                                'pilote__c': '',
                                'reference__c': '',
                                'version__c': ''
                            });
                        }
                    });
            $A.enqueueAction(action);

        } else {
            alert("ajout échouée");
        }
        component.set("v.isOpen", false);
    },

    getUserEntites: function(component, event, helper) {
        var selectedEntiteId = component.find('proprietaireID').get('v.value');
        var action = component.get('c.findUserEntites');
        action.setParam("entite", selectedEntiteId);
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                component.set('v.userEntites', response.getReturnValue());
            } else {
                alert('impossible de récuperer la liste des users entités');
            }
        });
        $A.enqueueAction(action);

    }

})