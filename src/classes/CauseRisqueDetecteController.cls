public with sharing class CauseRisqueDetecteController {
    @AuraEnabled
	public static List<CauseRisqueDetecte__c> findAll(String risqueEntite){
		return [SELECT Id,Description__c,Name,risqueEntite__c FROM CauseRisqueDetecte__c where risqueEntite__c=:risqueEntite order by Name];
	}
	
	@AuraEnabled
	public static CauseRisqueDetecte__c add(CauseRisqueDetecte__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static CauseRisqueDetecte__c remove(CauseRisqueDetecte__c item){
		delete item;
		return item;
	} 

	@AuraEnabled
	public static CauseRisqueDetecte__c getElementById(String Id){
		return [select Id, Name,Description__c from CauseRisqueDetecte__c where Id=:Id];
	}
}