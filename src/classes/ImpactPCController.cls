public with sharing class ImpactPCController {
     @AuraEnabled
	public static List<ImpactPC__c> findFromPartieConcernee(String partieConcernee){
		return [SELECT Id,Name,PartieConcernee__c FROM ImpactPC__c where PartieConcernee__c=:partieConcernee order by Name];
	}
	
	@AuraEnabled
	public static ImpactPC__c add(ImpactPC__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ImpactPC__c remove(ImpactPC__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static ImpactPC__c getElementById(String Id){
		return [SELECT Id,Name,PartieConcernee__c FROM ImpactPC__c where Id=:Id];
	}
}