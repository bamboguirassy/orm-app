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
	
}