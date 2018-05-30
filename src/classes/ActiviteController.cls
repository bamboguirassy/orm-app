public with sharing class ActiviteController {
	
	@AuraEnabled
	public static Activite__c getElementById(String Id){
		return [SELECT Id,cout__c,date__c,delai__c,Name,plan_Action__c,plan_Action__r.Name,responsable__c,responsable__r.Name,statut__c,type__c,plan_Action__r.risque_Entite__r.Entite__c,plan_Action__r.ParamRisqueEntite__r.entite__c FROM Activite__c where Id=:Id ];	
	}
	
    @AuraEnabled
	public static List<Activite__c> findAllByPlanAction(String planAction){
		return [SELECT Id,cout__c,date__c,delai__c,Name,plan_Action__c,plan_Action__r.Name,responsable__c,responsable__r.Name,statut__c,type__c FROM Activite__c where plan_Action__c=:planAction order by date__c desc];
	}
	
	@AuraEnabled
	public static List<Activite__c> findAll(){
		return [SELECT Id,cout__c,date__c,delai__c,Name,plan_Action__c,plan_Action__r.Name,responsable__c,responsable__r.Name,statut__c,type__c FROM Activite__c order by date__c desc];
	}
	
	@AuraEnabled
	public static Activite__c add(Activite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Activite__c remove(Activite__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Contact> findUserEntites(String entite){
		return [select Id,Name,AccountId from Contact where AccountId=:entite];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Activite__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Activite__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Activite__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
          //get field description
       	type='Plan_Action__c';
         leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        objectFields.put('plan', SObjectType.Plan_Action__c.getLabel());
        
         //get field description
       	type='Contact';
         leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        objectFields.put('contactActivite', SObjectType.Contact.getLabel());
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
}