public with sharing class MesurePreventionController {
     @AuraEnabled
	public static List<Mesure_Prevention__c> findAll(String risque){
		return [SELECT Id,Name,Description__c,CategorieMesurePrevention__r.Name,Risque__c FROM Mesure_Prevention__c where Risque__c=:risque order by Name];
	}
	
	 @AuraEnabled
	public static List<Mesure_Prevention__c> filterFromCategorie(String categorie, String risque){
		return [SELECT Id,Name,Description__c,CategorieMesurePrevention__r.Name,Risque__c FROM Mesure_Prevention__c where Risque__c=:risque and CategorieMesurePrevention__c=:categorie order by Name];
	}
	
	@AuraEnabled
	public static Mesure_Prevention__c add(Mesure_Prevention__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Mesure_Prevention__c remove(Mesure_Prevention__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Categorie_Mesure_Prevention__c> getCategorieMesurePreventions(){
		return [SELECT Id,Name FROM Categorie_Mesure_Prevention__c order by Name];
	}
	@AuraEnabled
	public static Mesure_Prevention__c getElementById(String Id){
		return [SELECT Id,Name,Description__c,CategorieMesurePrevention__r.Name,Risque__c FROM Mesure_Prevention__c where Id=:Id];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Mesure_Prevention__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Mesure_Prevention__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Mesure_Prevention__c.getLabelPlural());
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