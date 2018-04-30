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
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='PREtracker__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.PREtracker__c.getLabel());
        objectFields.put('labelPlural', SObjectType.PREtracker__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
}