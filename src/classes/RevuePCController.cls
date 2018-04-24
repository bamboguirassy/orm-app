public with sharing class RevuePCController {
     @AuraEnabled
	public static List<RevuePC__c> findFromPartieConcernee(String partieConcernee){
		return [SELECT Id,Name,PartieConcernee__c FROM RevuePC__c where PartieConcernee__c=:partieConcernee order by Name];
	}
	
	@AuraEnabled
	public static RevuePC__c add(RevuePC__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static RevuePC__c remove(RevuePC__c item){
		delete item;
		return item;
	} 
	@AuraEnabled
	public static RevuePC__c getElementById(String Id){
		return [SELECT Id,Name,PartieConcernee__c
		 FROM RevuePC__c where Id=:Id];
	}
}