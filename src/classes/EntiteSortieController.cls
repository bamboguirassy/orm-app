public with sharing class EntiteSortieController {
     @AuraEnabled
	public static List<EntiteSortie__c> findFromProcessus(String processus){
		return [SELECT Id,entite__r.Name,entite__r.Phone,entite__r.Website,entite__r.Type FROM EntiteSortie__c where processus__c=:processus order by entite__r.Name];
	
	}
	
	@AuraEnabled
	public static EntiteSortie__c add(EntiteSortie__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static EntiteSortie__c remove(EntiteSortie__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Account> getEntites(){
		return [SELECT Id,Name FROM Account where  RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Name ];
	}
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='EntiteSortie__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.EntiteSortie__c.getLabel());
        objectFields.put('labelPlural', SObjectType.EntiteSortie__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        type='Account';
        leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
      objectFields.put('entiteLabel', SObjectType.Account.getLabel());
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
}