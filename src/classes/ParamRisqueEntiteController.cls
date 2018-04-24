public with sharing class ParamRisqueEntiteController {
     @AuraEnabled
	public static List<ParamRisqueEntite__c> findFromEntite(String entite){
		return [SELECT Id,risque__r.Name,seuilApparution__c,unite__c,apparu__c,entite__c FROM ParamRisqueEntite__c where entite__c=:entite order by risque__r.Name];
	 }
	
	@AuraEnabled
	public static ParamRisqueEntite__c add(ParamRisqueEntite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ParamRisqueEntite__c remove(ParamRisqueEntite__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Risque__c> getRisques(String entite){
		return [SELECT Id,Name FROM Risque__c order by Name];
	}
	@AuraEnabled
	public static ParamRisqueEntite__c getElementById(String Id){
		return [SELECT Id,risque__r.Name,seuilApparution__c,unite__c,apparu__c,entite__c FROM ParamRisqueEntite__c where Id=:Id];
	}
}