public with sharing class CategorieRisqueController {
	@AuraEnabled
	public static List<Categorie_Risque__c> findAll(){
		return [SELECT Name,Description__c FROM Categorie_Risque__c order by Name];
	}
	
	@AuraEnabled
	public static Categorie_Risque__c add(Categorie_Risque__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Categorie_Risque__c remove(Categorie_Risque__c item){
		delete item;
		return item;
	}

	@AuraEnabled
	public static Categorie_Risque__c getElementById(String Id){
		return [select Id, Name,Description__c from Categorie_Risque__c where Id=:Id];
	}
	
	 @AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Categorie_Risque__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Categorie_Risque__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Categorie_Risque__c.getLabelPlural());
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