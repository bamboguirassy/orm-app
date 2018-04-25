public with sharing class CategorieImpactController{
    @AuraEnabled
	public static List<CategorieImpact__c> findAll(){
		return [SELECT Name,Description__c FROM CategorieImpact__c order by Name];
	}
	
	@AuraEnabled
	public static CategorieImpact__c add(CategorieImpact__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static CategorieImpact__c remove(CategorieImpact__c item){
		delete item;
		return item;
	}
	
	@AuraEnabled
	public static CategorieImpact__c getElementById(String Id){
		return [SELECT Id,Name,Description__c FROM CategorieImpact__c WHERE Id=:Id];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='CategorieImpact__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.CategorieImpact__c.getLabel());
        objectFields.put('labelPlural', SObjectType.CategorieImpact__c.getLabelPlural());
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