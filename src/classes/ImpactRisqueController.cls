public with sharing class ImpactRisqueController {
     @AuraEnabled
	public static List<Impact__c> findAll(String risque){
		return [SELECT Id,Name,description__c,Categorie_Impact__r.Name,risque__c FROM Impact__c where risque__c=:risque order by Name];
	}
	
	 @AuraEnabled
	public static List<Impact__c> filterFromCategorie(String categorie, String risque){
		return [SELECT Id,Name,description__c,Categorie_Impact__r.Name,risque__c FROM Impact__c where risque__c=:risque and Categorie_Impact__c=:categorie order by Name];
	}
	
	@AuraEnabled
	public static Impact__c add(Impact__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Impact__c remove(Impact__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<CategorieImpact__c> getCategorieImpacts(){
		return [SELECT Id,Name FROM CategorieImpact__c order by Name];
	}
	@AuraEnabled
	public static Impact__c getElementById(String Id){
		return [SELECT Id,Name,description__c FROM Impact__c where Id=:Id];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Impact__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Impact__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Impact__c.getLabelPlural());
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