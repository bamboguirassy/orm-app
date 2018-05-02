public with sharing class PartieInteresseeController {
     @AuraEnabled
	public static List<PartieInteressee__c> findFromPartieConcernee(String partieConcernee){
		return [SELECT Id,Name,PartieConcernee__c FROM PartieInteressee__c where PartieConcernee__c=:partieConcernee order by Name];
	}
	
	@AuraEnabled
	public static PartieInteressee__c add(PartieInteressee__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static PartieInteressee__c getElementById(String Id){
		return [SELECT Id,Name,PartieConcernee__c FROM PartieInteressee__c where Id=:Id];
	}
	
	@AuraEnabled
	public static PartieInteressee__c remove(PartieInteressee__c item){
		delete item;
		return item;
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='PartieInteressee__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.PartieInteressee__c.getLabel());
        objectFields.put('labelPlural', SObjectType.PartieInteressee__c.getLabelPlural());
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