trigger ImpactTrigger on Impact__c (before delete) {
    
    if(Trigger.isBefore){
    	if(Trigger.isDelete){
    		
    		List<Impact_Risque_Entite__c> impactRisqueEntites = new List<Impact_Risque_Entite__c>();
    		//ImpactRisque__c
    		for(Impact__c imp : Trigger.Old){
    			impactRisqueEntites.addAll([SELECT Id FROM Impact_Risque_Entite__c WHERE ImpactRisque__c =:imp.Id]);
    		}
    		
    		delete impactRisqueEntites;
    	}
    }
}