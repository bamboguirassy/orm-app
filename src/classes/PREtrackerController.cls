public with sharing class PREtrackerController {
      @AuraEnabled
	public static List<PREtracker__c> findFromParamRisqueEntite(String paramRisqueEntite){
		return [SELECT Id,description__c,ParamRisqueEntite__c,valeur__c FROM PREtracker__c where ParamRisqueEntite__c=:paramRisqueEntite order by description__c];
	}
	
	@AuraEnabled
	public static List<Object> add(PREtracker__c item){
		upsert item;
		
		//find the value of aggregated pretracker values for the Param Risq
		AggregateResult[] groupedResults=[select SUM(valeur__c) sum,ParamRisqueEntite__c param from PREtracker__c where ParamRisqueEntite__c=:item.ParamRisqueEntite__c group by ParamRisqueEntite__c];
		List<Object> vals=new List<Object>();
		vals.add(groupedResults[0].get('sum'));
		vals.add(groupedResults[0].get('param'));
		return vals;
	}
	
	@AuraEnabled
	public static PREtracker__c remove(PREtracker__c item){
		delete item;
		return item;
	} 
	@AuraEnabled
	public static PREtracker__c getElementById(String Id){
		return [SELECT Id,description__c,ParamRisqueEntite__c,valeur__c from PREtracker__c where Id=:Id];
	}
}