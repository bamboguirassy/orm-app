public with sharing class  RisqueProjetController {
	
	@AuraEnabled
	public static List<Risque_projet__c> findAll(String projet){
     return [SELECT Id,Risque_detecte__r.Risque__r.Name,Risque_detecte__r.Date_Detection__c,Risque_detecte__r.etat__c,Risque_detecte__r.criticite__c FROM Risque_projet__c where Projet__c=:projet];
		
	}
	
	    @AuraEnabled 
	public static List<Risque_Entite__c> getRisqueEntites(String entite){
		return [SELECT Id,Risque__r.Name FROM Risque_Entite__c where Entite__c=:entite order by Risque__r.Name ];
	}
	
	    
    @AuraEnabled
    public static Risque_projet__c add(Risque_projet__c item){
    	upsert item;
    	return item;
    	
    }
    
    @AuraEnabled 
    public static Risque_projet__c remove(Risque_projet__c item){
    	delete item;
    	return item;
    }
    
    	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Risque_projet__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Risque_projet__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Risque_projet__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
         type='Risque_Entite__c';
         leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
         //loop over description
        for (String fieldName: fieldMap.keySet()) {
        	if(fieldName!='name'){
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        	}
        }
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
	
    
    
}