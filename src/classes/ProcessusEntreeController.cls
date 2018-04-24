public with sharing class ProcessusEntreeController {
   
   @AuraEnabled
	public static List<ProcessusEntree__c> findFromProcessus(String processus){
		return [SELECT Id,source__r.Name,source__r.dateApplication__c,source__r.version__c,source__r.proprietaire__r.Name FROM ProcessusEntree__c where processus__c=:processus order by source__r.Name];
	}
	
	@AuraEnabled
	public static ProcessusEntree__c add(ProcessusEntree__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ProcessusEntree__c remove(ProcessusEntree__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Processus__c> getProcessus(String entite){
		return [SELECT Id,Name FROM Processus__c where proprietaire__c=:entite order by Name ];
	}
  
}