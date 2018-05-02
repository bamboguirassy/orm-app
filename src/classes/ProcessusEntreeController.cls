public with sharing class ProcessusEntreeController {
   
   @AuraEnabled
	public static List<ProcessusEntree__c> findFromProcessus(String processus){
		return [SELECT Id,source__r.Name,source__r.dateApplication__c,source__r.version__c,source__r.proprietaire__r.Name FROM ProcessusEntree__c where processus__c=:processus order by source__r.Name];
	}
	
	@AuraEnabled
	public static ProcessusEntree__c add(ProcessusEntree__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ProcessusEntree__c remove(ProcessusEntree__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Processus__c> getProcessus(String entite){
		return [SELECT Id,Name FROM Processus__c where proprietaire__c=:entite order by Name ];
	}
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='ProcessusEntree__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.ProcessusEntree__c.getLabel());
        objectFields.put('labelPlural', SObjectType.ProcessusEntree__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        //get field description
       	type='Processus__c';
         leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
     objectFields.put('processus', SObjectType.Processus__c.getLabel());
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
  
}