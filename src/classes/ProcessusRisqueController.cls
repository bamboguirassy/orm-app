public with sharing class ProcessusRisqueController {
    
    @AuraEnabled
	public static List<ProcessusRisque__c> findFromProcessus(String processus){
		return [SELECT Id,risqueEntite__r.Risque__r.Name,risqueEntite__r.Date_Detection__c,risqueEntite__r.etat__c,risqueEntite__r.criticite__c FROM ProcessusRisque__c where processus__c=:processus order by risqueEntite__r.Risque__r.Name];
	}
	
	@AuraEnabled
	public static ProcessusRisque__c add(ProcessusRisque__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ProcessusRisque__c remove(ProcessusRisque__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Risque_Entite__c> getRisqueEntites(String entite){
		return [SELECT Id,Risque__r.Name FROM Risque_Entite__c where Entite__c=:entite order by Risque__r.Name ];
	}
}