trigger ActivityTrigger on Activite__c (before delete) {
	
	
	if(Trigger.isBefore) {
		if(Trigger.isDelete) {
			
			List<Indicateur_Activite__c> indicateurActivities = new List<Indicateur_Activite__c>();
			List<Mesure__c> mesures = new List<Mesure__c>();
			//List<Evidence__c> evidences = new List<Evidence__c>();
			
			for(Activite__c act : Trigger.Old) {
				indicateurActivities.addAll([SELECT Id FROM Indicateur_Activite__c WHERE activite__c =:act.Id]);
				mesures.addAll([SELECT Id FROM Mesure__c WHERE activite__c =:act.Id]);
				//evidences.addAll([SELECT Id FROM Evidence__c WHERE evidenceOfActivity__r.activite__c =:act.Id]);	
			}
			
			delete indicateurActivities;
			//delete evidences;
			delete mesures;
		}
	}
}