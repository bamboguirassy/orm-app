public with sharing class ProcessusSortieController {
     @AuraEnabled
	public static List<ProcessusSortie__c> findFromProcessus(String processus){
		return [SELECT Id,destination__r.Name,destination__r.dateApplication__c,destination__r.version__c,destination__r.proprietaire__r.Name FROM ProcessusSortie__c where processus__c=:processus order by destination__r.Name];
	}
	
	@AuraEnabled
	public static ProcessusSortie__c add(ProcessusSortie__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ProcessusSortie__c remove(ProcessusSortie__c item){
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
        String type='ProcessusSortie__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.ProcessusSortie__c.getLabel());
        objectFields.put('labelPlural', SObjectType.ProcessusSortie__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
       type='Processus__c';
      leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
        //loop over description
      for (String fieldName: fieldMap.keySet()) {
           //fill variable
           objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
       }
      objectFields.put('processusLabel', SObjectType.Processus__c.getLabel());
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
}