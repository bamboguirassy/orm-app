({
	doInit : function(component, event, helper) {
		helper.getFieldLabels(component, event);
		/*statuts = [ 'Non fait', 'En cours', 'Fait' ];
		types = [ 'corrective', 'prévention', 'correction' ];
		component.set('v.statuts', statuts);
		component.set('v.types', types);*/

		var action = component.get("c.findUserEntites");
		// action.setParam("entite", component.get('v.entite'));
		if (component.get('v.planAction').risque_Entite__c) {
			action.setParam("entite",
					component.get('v.planAction').risque_Entite__r.Entite__c);
		} else {
			action
					.setParam(
							"entite",
							component.get('v.planAction').ParamRisqueEntite__r.entite__c);
		}
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state == "SUCCESS") {
				component.set("v.userEntites", response.getReturnValue());
			} else {
				alert("Echec de la recuperation des utilisateurs");
			}
			;

		});
		$A.enqueueAction(action);
	},

	createItem : function(component, event, helper) {
		var libelleField = component.find("libelle");
		var dateField = component.find('date');
		var delaiField = component.find('delai');
		var libelle = libelleField.get("v.value");
		var date = dateField.get('v.value');
		var delai = delaiField.get('v.value');
		var isItemValid = true;
		if ($A.util.isEmpty(libelle) || $A.util.isEmpty(date)
				|| $A.util.isEmpty(delai)) {
			isItemValid = false;
			libelleField.set("v.errors", [ {
				message : "Le libelle ne peut etre vide."
			} ]);
			alert("le libelle,la date, le délai ne peuvent etre vides");
		} else {
			libelleField.set("v.errors", null);
		}
		if (isItemValid) {

			var newItem = component.get("v.item");

			// newItem.plan_Action__c = component.get('v.planAction');
			newItem.plan_Action__c = component.get('v.planAction').Id;
			// newItem.plan_Action__r.risque_Entite__c =
			// component.get('v.planAction').risque_Entite__c;

			newItem.responsable__c = component.find('userEntiteID').get(
					'v.value');
			newItem.statut__c = component.find('statutid').get('v.value');
			newItem.type__c = component.find('typeid').get('v.value');
			newItem.cout__c = component.find('cout').get('v.value');
			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});

			action.setCallback(this, function(response) {
				var state = response.getState();
				if (state == "SUCCESS") {

					// deploy event
					var evt = $A.get("e.c:eventNewActiviteCreated");
					evt.fire();

					component.set("v.item", {
						'sobjectType' : 'Activite__c',
						'cout__c' : '',
						'date__c' : '',
						'delai__c' : '',
						'Name' : '',
						'statut__c' : '',
						'responsable__c' : '',
						'type__c' : '',
					});
					component.set("v.isOpen", false);
				}
			});
			$A.enqueueAction(action);

		} else {
			alert("ajout échouée");
		}

	},

})