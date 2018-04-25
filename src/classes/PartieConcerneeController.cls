public with sharing class PartieConcerneeController {
     @AuraEnabled
	public static List<PartieConcernee__c> findFromProcessus(String processus){
		return [SELECT Id,Name,processus__c FROM PartieConcernee__c where processus__c=:processus order by Name];
	}
	
	@AuraEnabled
	public static PartieConcernee__c add(PartieConcernee__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static PartieConcernee__c remove(PartieConcernee__c item){
		delete item;
		return item;
	}  
	
	@AuraEnabled
	public static PartieConcernee__c getElementById(String Id){
		return [SELECT Id,Name,processus__c FROM PartieConcernee__c where Id=:Id];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='PartieConcernee__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.PartieConcernee__c.getLabel());
        objectFields.put('labelPlural', SObjectType.PartieConcernee__c.getLabelPlural());
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