public with sharing class ModeSurveillancePCController {
     @AuraEnabled
	public static List<ModeSurveillancePC__c> findFromPartieConcernee(String partieConcernee){
		return [SELECT Id,Name,PartieConcernee__c FROM ModeSurveillancePC__c where PartieConcernee__c=:partieConcernee order by Name];
	}
	
	@AuraEnabled
	public static ModeSurveillancePC__c add(ModeSurveillancePC__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ModeSurveillancePC__c remove(ModeSurveillancePC__c item){
		delete item;
		return item;
	}
	
	@AuraEnabled
	public static ModeSurveillancePC__c getElementById(String Id){
		return [SELECT Id,Name, PartieConcernee__c  from ModeSurveillancePC__c where Id=:Id];
	}
	
}