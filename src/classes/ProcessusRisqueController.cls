public with sharing class ProcessusRisqueController {
    
    @AuraEnabled
	public static List<ProcessusRisque__c> findFromProcessus(String processus){
		return [SELECT Id,risqueEntite__r.Risque__r.Name,risqueEntite__r.Date_Detection__c,risqueEntite__r.etat__c,risqueEntite__r.criticite__c FROM ProcessusRisque__c where processus__c=:processus order by risqueEntite__r.Risque__r.Name];
	}
	
	@AuraEnabled
	public static ProcessusRisque__c add(ProcessusRisque__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ProcessusRisque__c remove(ProcessusRisque__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Risque_Entite__c> getRisqueEntites(String entite){
		return [SELECT Id,Risque__r.Name FROM Risque_Entite__c where Entite__c=:entite order by Risque__r.Name ];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='ProcessusRisque__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.ProcessusRisque__c.getLabel());
        objectFields.put('labelPlural', SObjectType.ProcessusRisque__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }        
      
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        
        //field type
        type='Risque_Entite__c';
        //get field description
        leadSchema = schemaMap.get(type);
        fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('labelRisque', SObjectType.Risque_Entite__c.getLabel());
        objectFields.put('labelPluralRisque', SObjectType.Risque_Entite__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
        	String name = fieldName;
        	if(fieldName == 'name'){
        		name = fieldName + 'Risque';
        	}
           //fill variable
            objectFields.put(name, fieldMap.get(fieldName).getDescribe().getLabel());
        }             
        
        return objectFields;
    }
}