public with sharing class PlanActionController {
	
	public static Id getPlanActionCorrectifRecordTypeId(){
         Id recordTypeId = Schema.SObjectType.Plan_Action__c.getRecordTypeInfosByName()
                  .get('Plan Action Correctif').getRecordTypeId();
        return recordTypeId;
    }
    
    @AuraEnabled
	public static List<Plan_Action__c> findAllByRisqueEntite(String risqueEntite){
		return [SELECT Id,commentaire__c,date_commencement__c,echeancier__c,etat__c,gestionnaire__r.Name,Name,gestionnaire__c,risque_Entite__c,risque_Entite__r.Entite__c FROM Plan_Action__c where risque_Entite__c=:risqueEntite and RecordTypeId=:PlanActionController.getPlanActionCorrectifRecordTypeId() order by Name];
	}
	
	@AuraEnabled
	public static List<Plan_Action__c> findAll(){
		return [SELECT Id,commentaire__c,date_commencement__c,echeancier__c,etat__c,gestionnaire__r.Name,Name,gestionnaire__c,risque_Entite__c,risque_Entite__r.Entite__c FROM Plan_Action__c where RecordTypeId=:PlanActionController.getPlanActionCorrectifRecordTypeId() order by Name];
	}
	
	@AuraEnabled
	public static Plan_Action__c add(Plan_Action__c item){
		item.RecordTypeId=PlanActionController.getPlanActionCorrectifRecordTypeId();
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Plan_Action__c remove(Plan_Action__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Contact> findUserEntites(String entite){
		return [select Id,Name,AccountId from Contact where AccountId=:entite];
	}
	
	
	@AuraEnabled
	public static Plan_Action__c getElementById(String Id){
		return [SELECT Id,commentaire__c,date_commencement__c,echeancier__c,etat__c,
		gestionnaire__r.Name,Name,gestionnaire__c,risque_Entite__c,
		risque_Entite__r.Risque__r.Name,risque_Entite__r.Entite__c FROM Plan_Action__c where Id=:Id];
	}
}