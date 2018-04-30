public with sharing class IntervenantProjetController {
    
    @AuraEnabled
    public static List<IntervenantProjet__c> findAll(String projet){
    	return [select Id, Intervenant__c, Intervenant__r.Name, Intervenant__r.Phone, 
		    	Intervenant__r.Email, Role__c, Project__r.Structure__c 
		    	from IntervenantProjet__c  
		    	where Project__c=:projet order by Intervenant__r.Name];
    }
    
    
    @AuraEnabled
    public static List<Contact> getIntervenants(String structureId){
    	return [SELECT Name, Id, Phone, Email FROM Contact WHERE AccountId =: structureId
    	ORDER BY Name];
    }
    
    @AuraEnabled
    public static List<Contact> getIntervenantsEdit(String structureId, String idIntervenant){
    	return [SELECT Name, Id, Phone, Email FROM Contact WHERE (AccountId =: structureId and Id<>:idIntervenant)
    	ORDER BY Name];
    }
    
    @AuraEnabled
    public static void add(IntervenantProjet__c item){
    	upsert item;
    }
    
     @AuraEnabled
    public static void remove(IntervenantProjet__c item){
    	delete item;
    }
    
    @AuraEnabled
	public static IntervenantProjet__c getElementById(String Id){
		return [select Id, Intervenant__c, Intervenant__r.Name, Role__c
		    	from IntervenantProjet__c where Id=:Id];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='IntervenantProjet__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.IntervenantProjet__c.getLabel());
        objectFields.put('labelPlural', SObjectType.IntervenantProjet__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);      
        
        //field type
        type='Contact';
        //get field description
        leadSchema = schemaMap.get(type);
        fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('labelIntervenant', SObjectType.Contact.getLabel());
        objectFields.put('labelPluralIntervenant', SObjectType.Contact.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        
        return objectFields;
    }
}