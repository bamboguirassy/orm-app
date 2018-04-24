public with sharing class MesurePreventionController {
     @AuraEnabled
	public static List<Mesure_Prevention__c> findAll(String risque){
		return [SELECT Id,Name,Description__c,CategorieMesurePrevention__r.Name,Risque__c FROM Mesure_Prevention__c where Risque__c=:risque order by Name];
	}
	
	 @AuraEnabled
	public static List<Mesure_Prevention__c> filterFromCategorie(String categorie, String risque){
		return [SELECT Id,Name,Description__c,CategorieMesurePrevention__r.Name,Risque__c FROM Mesure_Prevention__c where Risque__c=:risque and CategorieMesurePrevention__c=:categorie order by Name];
	}
	
	@AuraEnabled
	public static Mesure_Prevention__c add(Mesure_Prevention__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Mesure_Prevention__c remove(Mesure_Prevention__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Categorie_Mesure_Prevention__c> getCategorieMesurePreventions(){
		return [SELECT Id,Name FROM Categorie_Mesure_Prevention__c order by Name];
	}
	@AuraEnabled
	public static Mesure_Prevention__c getElementById(String Id){
		return [SELECT Id,Name,Description__c,CategorieMesurePrevention__r.Name,Risque__c FROM Mesure_Prevention__c where Id=:Id];
	}
}