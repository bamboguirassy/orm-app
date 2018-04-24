public with sharing class CategorieImpactController{
    @AuraEnabled
	public static List<CategorieImpact__c> findAll(){
		return [SELECT Name,Description__c FROM CategorieImpact__c order by Name];
	}
	
	@AuraEnabled
	public static CategorieImpact__c add(CategorieImpact__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static CategorieImpact__c remove(CategorieImpact__c item){
		delete item;
		return item;
	}
	
	@AuraEnabled
	public static CategorieImpact__c getElementById(String Id){
		return [SELECT Id,Name,Description__c FROM CategorieImpact__c WHERE Id=:Id];
	}
}