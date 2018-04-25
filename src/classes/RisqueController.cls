public with sharing class RisqueController {
    @AuraEnabled
	public static List<Risque__c> findAll(){
		return [SELECT Id,Name,description__c,categorieRisque__r.Name,categorieRisque__r.Description__c FROM Risque__c order by Name];
	}
	
	 @AuraEnabled
	public static List<Risque__c> filterFromCategorie(String categorie){
		return [SELECT Id,Name,description__c,categorieRisque__r.Name FROM Risque__c where categorieRisque__c=:categorie order by Name];
	}
	
	@AuraEnabled
	public static Risque__c add(Risque__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Risque__c remove(Risque__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Categorie_Risque__c> getCategorieRisques(){
		return [SELECT Id,Name FROM Categorie_Risque__c order by Name];
	}
	
	@AuraEnabled
	public static Risque__c getElementById(String Id){
		return [SELECT Id,Name,description__c,categorieRisque__c,categorieRisque__r.Description__c,categorieRisque__r.Name from Risque__c where Id=:Id];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Risque__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Risque__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Risque__c.getLabelPlural());
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