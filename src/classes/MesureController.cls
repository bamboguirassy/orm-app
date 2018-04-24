public with sharing class MesureController {
    @AuraEnabled
	public static List<Mesure__c> findAll(String activite){
		return [SELECT Id,activite__c,activite__r.Name,description__c,Name FROM Mesure__c where activite__c=:activite order by Name];
	}
	
	@AuraEnabled
	public static Mesure__c add(Mesure__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Mesure__c remove(Mesure__c item){
		delete item;
		return item;
	}
	@AuraEnabled
	public static Mesure__c getElementById(String Id){
		return [SELECT Id,activite__r.Name,activite__c,description__c,Name FROM Mesure__c where Id=:Id];
	}
}