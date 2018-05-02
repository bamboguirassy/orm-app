public with sharing class PlanActionPreventifController {
    public static Id getPlanActionPreventifRecordTypeId(){
         Id recordTypeId = Schema.SObjectType.Plan_Action__c.getRecordTypeInfosByName()
                  .get('Plan Action Preventif').getRecordTypeId();
        return recordTypeId;
    }
    
    @AuraEnabled
	public static List<Plan_Action__c> findAllByParamRisqueEntite(String paramRisqueEntite){
		return [SELECT Id,commentaire__c,date_commencement__c,echeancier__c,etat__c,gestionnaire__r.Name,Name,gestionnaire__c,ParamRisqueEntite__c,ParamRisqueEntite__r.entite__c FROM Plan_Action__c where ParamRisqueEntite__c=:paramRisqueEntite and RecordTypeId=:PlanActionPreventifController.getPlanActionPreventifRecordTypeId() order by Name];
	}
	
	@AuraEnabled
	public static List<Plan_Action__c> findAll(){
		return [SELECT Id,commentaire__c,date_commencement__c,echeancier__c,etat__c,gestionnaire__r.Name,Name,gestionnaire__c,ParamRisqueEntite__c,ParamRisqueEntite__r.entite__c FROM Plan_Action__c where RecordTypeId=:PlanActionPreventifController.getPlanActionPreventifRecordTypeId() order by Name];
	}
	
	@AuraEnabled
	public static Plan_Action__c add(Plan_Action__c item){
		item.RecordTypeId=PlanActionPreventifController.getPlanActionPreventifRecordTypeId();
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Plan_Action__c remove(Plan_Action__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Contact> findUserEntites(String entite){
		return [select Id,Name,AccountId from Contact where AccountId=:entite];
	}
	
	
	@AuraEnabled
	public static Plan_Action__c getElementById(String Id){
		return [SELECT Id,commentaire__c,date_commencement__c,echeancier__c,etat__c,
		gestionnaire__r.Name,Name,gestionnaire__c,ParamRisqueEntite__c,
		ParamRisqueEntite__r.risque__r.Name, ParamRisqueEntite__r.risque__r.description__c, ParamRisqueEntite__r.entite__c FROM Plan_Action__c where Id=:Id];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Plan_Action__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Plan_Action__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Plan_Action__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
         //get field description
       	type='Contact';
         leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
           String name = fieldName;
           if(fieldName =='name'){
           		name = fieldName + 'Manager';
           }
           objectFields.put(name, fieldMap.get(fieldName).getDescribe().getLabel());
        }
      objectFields.put('risqueLabel', SObjectType.Risque__c.getLabel());
      type='Risque__c';
      leadSchema = schemaMap.get(type);
      fieldMap = leadSchema.getDescribe().fields.getMap();
      String description = 'descriptionRisque';
      objectFields.put(description, fieldMap.get('description__c').getDescribe().getLabel());
       
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
}