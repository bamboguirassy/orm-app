public with sharing class PartieInteresseeController {
     @AuraEnabled
	public static List<PartieInteressee__c> findFromPartieConcernee(String partieConcernee){
		return [SELECT Id,Name,PartieConcernee__c FROM PartieInteressee__c where PartieConcernee__c=:partieConcernee order by Name];
	}
	
	@AuraEnabled
	public static PartieInteressee__c add(PartieInteressee__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static PartieInteressee__c getElementById(String Id){
		return [SELECT Id,Name,PartieConcernee__c FROM PartieInteressee__c where Id=:Id];
	}
	
	@AuraEnabled
	public static PartieInteressee__c remove(PartieInteressee__c item){
		delete item;
		return item;
	} 
}