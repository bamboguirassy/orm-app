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
}