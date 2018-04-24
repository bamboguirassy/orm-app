public with sharing class ElementSortieController {
     @AuraEnabled
	public static List<ElementSortie__c> findFromProcessus(String processus){
		return [SELECT Id,Name,processus__c FROM ElementSortie__c where processus__c=:processus order by Name];
	}
	
	@AuraEnabled
	public static ElementSortie__c getElementById(String Id){
		return [SELECT Id,Name,processus__c FROM ElementSortie__c where Id=:Id];
	}
	
	@AuraEnabled
	public static ElementSortie__c add(ElementSortie__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ElementSortie__c remove(ElementSortie__c item){
		delete item;
		return item;
	}  
}