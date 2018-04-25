public with sharing class RiskManagerController {
    public static Id getRiskManagerRecordTypeId(){
         Id recordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName()
                  .get('RiskManager').getRecordTypeId();
        return RecordTypeId;
    }
    
    @AuraEnabled
	public static List<Contact> findAll(String entite){
		return [SELECT Id,AccountId,Birthdate,Description,Email,FirstName,LastName,Phone FROM Contact where RecordTypeId=:RiskManagerController.getRiskManagerRecordTypeId() and AccountId=:entite order by LastName];
	}
	
	@AuraEnabled
	public static void add(Contact item){
		if(item!=null){
		item.RecordTypeId=RiskManagerController.getRiskManagerRecordTypeId();
			upsert item;
		}
	}
	
	@AuraEnabled
	public static Contact getElementById(String Id){
				return [SELECT Id,Name,AccountId,Birthdate,Description,Email,FirstName,LastName,Phone,Account.Name FROM Contact where Id=:Id and RecordTypeId=:RiskManagerController.getRiskManagerRecordTypeId()];
		
	}
	
	@AuraEnabled
	public static Contact remove(Contact item){
		delete item;
		return item;
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Contact';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Contact.getLabel());
        objectFields.put('labelPlural', SObjectType.Contact.getLabelPlural());
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