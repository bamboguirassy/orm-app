public with sharing class EntiteSortieController {
     @AuraEnabled
	public static List<EntiteSortie__c> findFromProcessus(String processus){
		return [SELECT Id,entite__r.Name,entite__r.Phone,entite__r.Website,entite__r.Type FROM EntiteSortie__c where processus__c=:processus order by entite__r.Name];
	
	}
	
	@AuraEnabled
	public static EntiteSortie__c add(EntiteSortie__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static EntiteSortie__c remove(EntiteSortie__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Account> getEntites(){
		return [SELECT Id,Name FROM Account where  RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Name ];
	}
}