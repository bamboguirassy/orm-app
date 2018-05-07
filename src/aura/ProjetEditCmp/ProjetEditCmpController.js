({
	doInit : function(component, event, helper) {
		helper.getFieldLabels(component, event);
		var action = component.get('c.getEntites');
		action.setCallback(this, function(response) {
			var state = response.getState();
			if (state = 'SUCCESS') {
				component.set("v.entites", response.getReturnValue());
			} else {
				alert('Impossible de récupérer la liste des structures');
			}
		});
		$A.enqueueAction(action);
		var actionResponsable = component.get('c.findUserEntites');
		actionResponsable.setParam("entite", component.get("v.item").Structure__c);
		actionResponsable.setCallback(this, function(response) {
			if (response.getState() == "SUCCESS") {
				component.set('v.userEntites', response.getReturnValue());
			} else {
				alert('impossible de récuperer la liste des users entités');
			}
		});
		$A.enqueueAction(actionResponsable);

	},
	editItem : function(component, event, helper) {

		var nomField = component.find("nom");
		var nom = nomField.get("v.value");
		var datedebutField = component.find("datedebut");
		var datedebut = datedebutField.get("v.value");
		var structureID = component.find("structureId").get("v.value");
		var responsableID = component.find("responsableId").get("v.value");
		var isItemValid = true;
		if ($A.util.isEmpty(nom) || $A.util.isEmpty(datedebut)
				|| $A.util.isEmpty(structureID)
				|| $A.util.isEmpty(responsableID)) {
			isItemValid = false;
			nomField
					.set(
							"v.errors",
							[ {
								message : "Le nom,la date de début, la structure et le responsable ne peuvent etre vides."
							} ]);
			alert("Le nom,la date de début et la structure et le responsable ne peuvent etre vides.");
		} else {
			nomField.set("v.errors", null);
		}
		if (isItemValid) {
			var newItem = component.get("v.item");
			newItem.Structure__c = structureID;
			newItem.Responsable__c = responsableID;
			newItem.Etat__c = component.find("etatID").get("v.value");
			var action = component.get('c.add');
			action.setParams({
				"item" : newItem
			});
			action
					.setCallback(
							this,
							function(response) {
								var state = response.getState();
								if (state == "SUCCESS") {
								//deploiement de l'evenement 
									var evt = $A.get("e.c:eventNewProjetCreated");
                            evt.fire();
									

									component.set("v.item", {
										'sobjectType' : 'Projet__c',
										'Name' : '',
										'Cout__c' : '',
										'Date_debut__c' : '',
										'Date_fin_prevue__c' : '',
										'Description__c' : '',
										'Etat__c' : '',
										'Structure__c' : '',
										'Responsable__c' : '',
										'Site_web_du_projet__c' : ''
									});
								}
							});
			$A.enqueueAction(action);

		} else {
			alert("ajout échouée");
		}
		component.set("v.isOpen", false);

	},
	getUserEntites : function(component, event, helper) {
	
		var selectedEntiteId = component.find('structureId').get('v.value');
	
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
	},
})