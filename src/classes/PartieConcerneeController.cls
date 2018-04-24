public with sharing class PartieConcerneeController {
     @AuraEnabled
	public static List<PartieConcernee__c> findFromProcessus(String processus){
		return [SELECT Id,Name,processus__c FROM PartieConcernee__c where processus__c=:processus order by Name];
	}
	
	@AuraEnabled
	public static PartieConcernee__c add(PartieConcernee__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static PartieConcernee__c remove(PartieConcernee__c item){
		delete item;
		return item;
	}  
	
	@AuraEnabled
	public static PartieConcernee__c getElementById(String Id){
		return [SELECT Id,Name,processus__c FROM PartieConcernee__c where Id=:Id];
	}
}