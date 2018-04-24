public with sharing class ExigencePCController {
    @AuraEnabled
	public static List<ExigencePC__c> findFromPartieConcernee(String partieConcernee){
		return [SELECT Id,Name,PartieConcernee__c FROM ExigencePC__c where PartieConcernee__c=:partieConcernee order by Name];
	}
	
	@AuraEnabled
	public static ExigencePC__c add(ExigencePC__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ExigencePC__c remove(ExigencePC__c item){
		delete item;
		return item;
	} 
	  @AuraEnabled
	public static ExigencePC__c getElementById(String Id){
		return [SELECT Id,Name,PartieConcernee__c FROM ExigencePC__c where Id=:Id];
	}
}