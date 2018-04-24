public with sharing class CategorieMesurePreventionController {
     @AuraEnabled
	public static List<Categorie_Mesure_Prevention__c> findAll(){
		return [SELECT Id,Name,Description__c FROM Categorie_Mesure_Prevention__c order by Name];
	}
	
	@AuraEnabled
	public static Categorie_Mesure_Prevention__c add(Categorie_Mesure_Prevention__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Categorie_Mesure_Prevention__c remove(Categorie_Mesure_Prevention__c item){
		delete item;
		return item;
	}
	@AuraEnabled
	public static Categorie_Mesure_Prevention__c getElementById(String Id){
		return [SELECT Id,Name,Description__c FROM Categorie_Mesure_Prevention__c where Id=:Id];
	}

}