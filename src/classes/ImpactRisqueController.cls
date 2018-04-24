public with sharing class ImpactRisqueController {
     @AuraEnabled
	public static List<Impact__c> findAll(String risque){
		return [SELECT Id,Name,description__c,Categorie_Impact__r.Name,risque__c FROM Impact__c where risque__c=:risque order by Name];
	}
	
	 @AuraEnabled
	public static List<Impact__c> filterFromCategorie(String categorie, String risque){
		return [SELECT Id,Name,description__c,Categorie_Impact__r.Name,risque__c FROM Impact__c where risque__c=:risque and Categorie_Impact__c=:categorie order by Name];
	}
	
	@AuraEnabled
	public static Impact__c add(Impact__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Impact__c remove(Impact__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<CategorieImpact__c> getCategorieImpacts(){
		return [SELECT Id,Name FROM CategorieImpact__c order by Name];
	}
	@AuraEnabled
	public static Impact__c getElementById(String Id){
		return [SELECT Id,Name,description__c FROM Impact__c where Id=:Id];
	}
}