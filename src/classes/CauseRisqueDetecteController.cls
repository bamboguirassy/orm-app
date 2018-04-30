public with sharing class CauseRisqueDetecteController {
    @AuraEnabled
	public static List<CauseRisqueDetecte__c> findAll(String risqueEntite){
		return [SELECT Id,Description__c,Name,risqueEntite__c FROM CauseRisqueDetecte__c where risqueEntite__c=:risqueEntite order by Name];
	}
	
	@AuraEnabled
	public static CauseRisqueDetecte__c add(CauseRisqueDetecte__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static CauseRisqueDetecte__c remove(CauseRisqueDetecte__c item){
		delete item;
		return item;
	} 

	@AuraEnabled
	public static CauseRisqueDetecte__c getElementById(String Id){
		return [select Id, Name,Description__c from CauseRisqueDetecte__c where Id=:Id];
	}
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='CauseRisqueDetecte__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.CauseRisqueDetecte__c.getLabel());
        objectFields.put('labelPlural', SObjectType.CauseRisqueDetecte__c.getLabelPlural());
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