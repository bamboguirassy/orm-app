trigger MesureTrigger on Mesure__c (before delete) {
    
    if(Trigger.isBefore) {
		if(Trigger.isDelete) {
			
			List<Evidence__c> evidences = new List<Evidence__c>();
			for(Mesure__c mesure : Trigger.Old) {				
				evidences.addAll([SELECT Id FROM Evidence__c WHERE evidenceOfActivity__c =:mesure.Id]);
			}
			delete evidences;
		}
    }
}