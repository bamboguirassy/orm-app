public with sharing class EntiteController {
    public static Id getStructureRecordTypeId(){
         Id recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName()
                  .get('Structure').getRecordTypeId();
        return RecordTypeId;
    }
    @AuraEnabled
	public static List<Account> findAll(){
		return [SELECT Id,Name,Phone,Website,Description,Type,ParentId,Parent.Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Name];
	}
    
    @AuraEnabled
    public static Account add(Account item){
        if(item!=null){
            item.RecordTypeId=EntiteController.getStructureRecordTypeId();
            upsert item;
           	return item;
        }
       
        return item;
        
    }
	
	    @AuraEnabled 
    public static Account remove(Account item){
    	delete item;
    	return item;
    }
 
	
	@AuraEnabled
	public static List<Account> filterFromEntite(String entite){
		return [SELECT Id,Name,Phone,Website,Description,Type,ParentId FROM Account where ParentId=:entite and recordTypeId=:EntiteController.getStructureRecordTypeId() order by Name];
	}
	
	@AuraEnabled
	public static Account getElementById(String Id){
		return [SELECT Id,Name,Phone,Website,Description,Type,ParentId FROM Account where Id=:Id and recordTypeId=:EntiteController.getStructureRecordTypeId()];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Account';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Account.getLabel());
        objectFields.put('labelPlural', SObjectType.Account.getLabelPlural());
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