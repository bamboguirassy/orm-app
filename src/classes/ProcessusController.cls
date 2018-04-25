public with sharing class ProcessusController {
	
	@AuraEnabled
	public static List<Processus__c> findAll(){
		return [SELECT Id,copilote__c,dateApplication__c,finalite__c,Name,pilote__c,proprietaire__c,reference__c,version__c FROM Processus__c order by Name];
	}
	
    @AuraEnabled
	public static List<Processus__c> findFromEntite(String entite){
		return [SELECT Id,copilote__c,dateApplication__c,finalite__c,Name,pilote__c,proprietaire__c,reference__c,version__c FROM Processus__c where proprietaire__c=:entite order by Name];
	}
    
	@AuraEnabled
	public static Processus__c add(Processus__c item){
		upsert item;
		return item;
	}
	
	
	@AuraEnabled
	public static Processus__c remove(Processus__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static Processus__c getElementById(String Id){
		return [SELECT Id,copilote__r.Name,dateApplication__c,finalite__c,Name,pilote__r.Name,proprietaire__c,reference__c,version__c from Processus__c where Id=:Id];
	}
	
	@AuraEnabled
	public static List<Account> getEntites(){
		return [Select Id,Name from Account where RecordTypeId=:EntiteController.getStructureRecordTypeId()];
	}
    
    @AuraEnabled
	public static List<Contact> findUserEntites(String entite){
		return [select Id,Name from Contact where AccountId=:entite];
	}
	
	@AuraEnabled
	public static List<Processus__c> findAllByRiskManager(String idRiskManager){
		return [SELECT Id,Name,pilote__c,dateApplication__c FROM Processus__c WHERE  pilote__c =: idRiskManager and pilote__r.RecordTypeId=:RiskManagerController.getRiskManagerRecordTypeId()  order by dateApplication__c desc];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Processus__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Processus__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Processus__c.getLabelPlural());
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