public with sharing class IndicateurActiviteController {
  @AuraEnabled
	public static List<Indicateur_Activite__c> findAll(String activite){
		return [SELECT Id,activite__c,activite__r.Name,description__c,Name FROM Indicateur_Activite__c where activite__c=:activite order by Name];
	}
	
	@AuraEnabled
	public static Indicateur_Activite__c add(Indicateur_Activite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Indicateur_Activite__c remove(Indicateur_Activite__c item){
		delete item;
		return item;
	}  
	@AuraEnabled
	public static Indicateur_Activite__c getElementById(String Id){
		return [SELECT Id,activite__c,activite__r.Name,Name,description__c FROM Indicateur_Activite__c where Id=:Id];
	}
}