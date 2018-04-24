public with sharing class ElementEntreeController {
    @AuraEnabled
	public static List<ElementEntree__c> findFromProcessus(String processus){
		return [SELECT Id,Name,processus__c FROM ElementEntree__c where processus__c=:processus order by Name];
	}
	
	@AuraEnabled
	public static ElementEntree__c add(ElementEntree__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ElementEntree__c remove(ElementEntree__c item){
		delete item;
		return item;
	}  
	@AuraEnabled
	public static ElementEntree__c getElementById(String Id){
		return [SELECT Id,Name,processus__c FROM ElementEntree__c where Id=:Id];
	}
}