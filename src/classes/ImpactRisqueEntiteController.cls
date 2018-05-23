public with sharing class ImpactRisqueEntiteController {
     @AuraEnabled
	public static List<Impact_Risque_Entite__c> findAll(String risqueEntite){
		return [SELECT Id,ImpactRisque__r.Name,ImpactRisque__r.description__c,risque_Entite__r.Risque__r.Name FROM Impact_Risque_Entite__c where risque_Entite__c=:risqueEntite];
	}
	
	@AuraEnabled
	public static Impact_Risque_Entite__c add(Impact_Risque_Entite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Impact_Risque_Entite__c remove(Impact_Risque_Entite__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Impact__c> getImpacts(String risque){
		return [SELECT Id,Name FROM Impact__c where risque__c=:risque order by Name];
	}
		@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Impact_Risque_Entite__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Impact_Risque_Entite__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Impact_Risque_Entite__c.getLabelPlural());
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