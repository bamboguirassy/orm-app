public with sharing class IndicateurActiviteController {
  @AuraEnabled
	public static List<Indicateur_Activite__c> findAll(String activite){
		return [SELECT Id,activite__c,activite__r.Name,description__c,Name FROM Indicateur_Activite__c where activite__c=:activite order by Name];
	}
	
	@AuraEnabled
	public static Indicateur_Activite__c add(Indicateur_Activite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Indicateur_Activite__c remove(Indicateur_Activite__c item){
		delete item;
		return item;
	}  
	@AuraEnabled
	public static Indicateur_Activite__c getElementById(String Id){
		return [SELECT Id,activite__c,activite__r.Name,Name,description__c FROM Indicateur_Activite__c where Id=:Id];
	}
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Indicateur_Activite__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Indicateur_Activite__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Indicateur_Activite__c.getLabelPlural());
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