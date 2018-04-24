public with sharing class CritereEfficacitePCController {
    @AuraEnabled
	public static List<CritereEfficacitePC__c> findFromPartieConcernee(String partieConcernee){
		return [SELECT Id,Name,PartieConcernee__c FROM CritereEfficacitePC__c where PartieConcernee__c=:partieConcernee order by Name];
	}

	@AuraEnabled
	public static CritereEfficacitePC__c getElementById(String Id){
		return [SELECT Id,Name,PartieConcernee__c FROM CritereEfficacitePC__c where Id=:Id];
	}
	
	@AuraEnabled
	public static CritereEfficacitePC__c add(CritereEfficacitePC__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static CritereEfficacitePC__c remove(CritereEfficacitePC__c item){
		delete item;
		return item;
	} 
}