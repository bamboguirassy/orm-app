public with sharing class ElementSortieController {
     @AuraEnabled
	public static List<ElementSortie__c> findFromProcessus(String processus){
		return [SELECT Id,Name,processus__c FROM ElementSortie__c where processus__c=:processus order by Name];
	}
	
	@AuraEnabled
	public static ElementSortie__c getElementById(String Id){
		return [SELECT Id,Name,processus__c FROM ElementSortie__c where Id=:Id];
	}
	
	@AuraEnabled
	public static ElementSortie__c add(ElementSortie__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ElementSortie__c remove(ElementSortie__c item){
		delete item;
		return item;
	}  
	
		
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Processus__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.ElementSortie__c.getLabel());
        objectFields.put('labelPlural', SObjectType.ElementSortie__c.getLabelPlural());
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