public with sharing class PlanActionPreventifController {
    public static Id getPlanActionPreventifRecordTypeId(){
         Id recordTypeId = Schema.SObjectType.Plan_Action__c.getRecordTypeInfosByName()
                  .get('Plan Action Preventif').getRecordTypeId();
        return recordTypeId;
    }
    
    @AuraEnabled
	public static List<Plan_Action__c> findAllByParamRisqueEntite(String paramRisqueEntite){
		return [SELECT Id,commentaire__c,date_commencement__c,echeancier__c,etat__c,gestionnaire__r.Name,Name,gestionnaire__c,ParamRisqueEntite__c,ParamRisqueEntite__r.entite__c FROM Plan_Action__c where ParamRisqueEntite__c=:paramRisqueEntite and RecordTypeId=:PlanActionPreventifController.getPlanActionPreventifRecordTypeId() order by Name];
	}
	
	@AuraEnabled
	public static List<Plan_Action__c> findAll(){
		return [SELECT Id,commentaire__c,date_commencement__c,echeancier__c,etat__c,gestionnaire__r.Name,Name,gestionnaire__c,ParamRisqueEntite__c,ParamRisqueEntite__r.entite__c FROM Plan_Action__c where RecordTypeId=:PlanActionPreventifController.getPlanActionPreventifRecordTypeId() order by Name];
	}
	
	@AuraEnabled
	public static Plan_Action__c add(Plan_Action__c item){
		item.RecordTypeId=PlanActionPreventifController.getPlanActionPreventifRecordTypeId();
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
		gestionnaire__r.Name,Name,gestionnaire__c,ParamRisqueEntite__c,
		ParamRisqueEntite__r.risque__r.Name,ParamRisqueEntite__r.entite__c FROM Plan_Action__c where Id=:Id];
	}
}