public with sharing class EntiteSourceController {
     @AuraEnabled
	public static List<EntiteSource__c> findFromProcessus(String processus){
		return [SELECT Id,entite__r.Name,entite__r.Phone,entite__r.Website,entite__r.Type FROM EntiteSource__c where processus__c=:processus order by entite__r.Name];
	}
	
	@AuraEnabled
	public static EntiteSource__c add(EntiteSource__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static EntiteSource__c remove(EntiteSource__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Account> getEntites(){
		return [SELECT Id,Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Name ];
	}
}