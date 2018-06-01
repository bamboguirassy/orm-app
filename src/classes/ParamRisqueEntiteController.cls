public with sharing class ParamRisqueEntiteController {
    @AuraEnabled
	public static List<ParamRisqueEntite__c> findFromEntite(String entite){
		return [SELECT Id,risque__r.Name,seuilApparution__c,unite__c,apparu__c,entite__c FROM ParamRisqueEntite__c where entite__c=:entite order by risque__r.Name];
	 }
	
	@AuraEnabled
	public static ParamRisqueEntite__c add(ParamRisqueEntite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static ParamRisqueEntite__c remove(ParamRisqueEntite__c item){
		delete item;
		return item;
	} 
	
	  @AuraEnabled
	public static List<Risque__c> getRisques(String entite){
		return [SELECT Id,Name FROM Risque__c order by Name];
	}
	@AuraEnabled
	public static ParamRisqueEntite__c getElementById(String Id){
		return [SELECT Id,risque__r.Name,seuilApparution__c,unite__c,apparu__c,entite__c FROM ParamRisqueEntite__c where Id=:Id];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='ParamRisqueEntite__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.ParamRisqueEntite__c.getLabel());
        objectFields.put('labelPlural', SObjectType.ParamRisqueEntite__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        
        //get field description
       	type='Risque__c';
         leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
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