public with sharing class MesureController {
    @AuraEnabled
	public static List<Mesure__c> findAll(String activite){
		return [SELECT Id,activite__c,activite__r.Name,description__c,Name FROM Mesure__c where activite__c=:activite order by Name];
	}
	
	@AuraEnabled
	public static Mesure__c add(Mesure__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Mesure__c remove(Mesure__c item){
		delete item;
		return item;
	}
	@AuraEnabled
	public static Mesure__c getElementById(String Id){
		return [SELECT Id,activite__r.Name,activite__c,description__c,Name FROM Mesure__c where Id=:Id];
	}
	
		@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Mesure__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Mesure__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Mesure__c.getLabelPlural());
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