public with sharing class EntiteAffecteeController {
	
	 public static Id getStructureRecordTypeId(){
         Id recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName()
                  .get('Structure').getRecordTypeId();
        return RecordTypeId;
    }
    
     @AuraEnabled
	public static List<Entite_Affectee__c> findAll(String risqueEntite){
 		return [SELECT Id,Entite__r.Name,Entite__r.Phone,risque_Entite__r.Risque__r.Name FROM Entite_Affectee__c where risque_Entite__c=:risqueEntite];
  }
    
  
	
	@AuraEnabled
	public static Entite_Affectee__c add(Entite_Affectee__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Entite_Affectee__c remove(Entite_Affectee__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Account> getEntites(){
		return [SELECT Id,Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId()order by Name];
	}
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Entite_Affectee__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Entite_Affectee__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Entite_Affectee__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        type='Account';
         leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        } objectFields.put('entiteAffectee', SObjectType.Account.getLabel());
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
}