trigger ActivityTrigger on Activite__c (before delete) {
	
	
	if(Trigger.isBefore) {
		if(Trigger.isDelete) {
			
			List<Indicateur_Activite__c> indicateurActivities = new List<Indicateur_Activite__c>();
			
			for(Activite__c act : Trigger.New){
				indicateurActivities.addAll([SELECT Id FROM Indicateur_Activite__c WHERE activite__c =:act.Id]);
			}
			
		}
	}
}