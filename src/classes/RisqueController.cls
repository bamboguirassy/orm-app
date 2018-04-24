public with sharing class RisqueController {
    @AuraEnabled
	public static List<Risque__c> findAll(){
		return [SELECT Id,Name,description__c,categorieRisque__r.Name,categorieRisque__r.Description__c FROM Risque__c order by Name];
	}
	
	 @AuraEnabled
	public static List<Risque__c> filterFromCategorie(String categorie){
		return [SELECT Id,Name,description__c,categorieRisque__r.Name FROM Risque__c where categorieRisque__c=:categorie order by Name];
	}
	
	@AuraEnabled
	public static Risque__c add(Risque__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Risque__c remove(Risque__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Categorie_Risque__c> getCategorieRisques(){
		return [SELECT Id,Name FROM Categorie_Risque__c order by Name];
	}
	
	@AuraEnabled
	public static Risque__c getElementById(String Id){
		return [SELECT Id,Name,description__c,categorieRisque__c,categorieRisque__r.Description__c,categorieRisque__r.Name from Risque__c where Id=:Id];
	}
}