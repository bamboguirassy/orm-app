public with sharing class ActiviteController {
	
	@AuraEnabled
	public static Activite__c getElementById(String Id){
		return [SELECT Id,cout__c,date__c,delai__c,Name,plan_Action__c,plan_Action__r.Name,responsable__c,responsable__r.Name,statut__c,type__c,plan_Action__r.risque_Entite__r.Entite__c,plan_Action__r.ParamRisqueEntite__r.entite__c FROM Activite__c where Id=:Id ];	
	}
	
    @AuraEnabled
	public static List<Activite__c> findAllByPlanAction(String planAction){
		return [SELECT Id,cout__c,date__c,delai__c,Name,plan_Action__c,plan_Action__r.Name,responsable__c,responsable__r.Name,statut__c,type__c FROM Activite__c where plan_Action__c=:planAction order by date__c desc];
	}
	
	@AuraEnabled
	public static List<Activite__c> findAll(){
		return [SELECT Id,cout__c,date__c,delai__c,Name,plan_Action__c,plan_Action__r.Name,responsable__c,responsable__r.Name,statut__c,type__c FROM Activite__c order by date__c desc];
	}
	
	@AuraEnabled
	public static Activite__c add(Activite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Activite__c remove(Activite__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Contact> findUserEntites(String entite){
		return [select Id,Name,AccountId from Contact where AccountId=:entite];
	}
	
	
}