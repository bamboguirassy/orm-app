public with sharing class ImpactRisqueEntiteController {
     @AuraEnabled
	public static List<Impact_Risque_Entite__c> findAll(String risqueEntite){
		return [SELECT Id,ImpactRisque__r.Name,risque_Entite__r.Risque__r.Name FROM Impact_Risque_Entite__c where risque_Entite__c=:risqueEntite];
	}
	
	@AuraEnabled
	public static Impact_Risque_Entite__c add(Impact_Risque_Entite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Impact_Risque_Entite__c remove(Impact_Risque_Entite__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Impact__c> getImpacts(String risque){
		return [SELECT Id,Name FROM Impact__c where risque__c=:risque order by Name];
	}
}