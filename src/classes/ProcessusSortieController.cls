public with sharing class ProcessusSortieController {
     @AuraEnabled
	public static List<ProcessusSortie__c> findFromProcessus(String processus){
		return [SELECT Id,destination__r.Name,destination__r.dateApplication__c,destination__r.version__c,destination__r.proprietaire__r.Name FROM ProcessusSortie__c where processus__c=:processus order by destination__r.Name];
	}
	
	@AuraEnabled
	public static ProcessusSortie__c add(ProcessusSortie__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ProcessusSortie__c remove(ProcessusSortie__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Processus__c> getProcessus(String entite){
		return [SELECT Id,Name FROM Processus__c where proprietaire__c=:entite order by Name ];
	}
}