public with sharing class ProjetController {
	   public static Id getStructureRecordTypeId(){
         Id recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName()
                  .get('Structure').getRecordTypeId();
        return RecordTypeId;
    }
    
    @AuraEnabled
    public static Projet__c getElementById(String Id){
    	return [SELECT Id,Cout__c, Date_debut__c, Date_fin_prevue__c,Description__c,Etat__c,Name,Responsable__c,Responsable__r.Name,Site_Web_du_projet__c,Structure__c,Structure__r.Name,Structure__r.Description FROM Projet__c where Id=:Id];
    	
    }
    
    @AuraEnabled
    public static list<Projet__c> findAll(){
   return [SELECT Id,Cout__c, Date_debut__c,Date_fin_prevue__c,Description__c,Etat__c,Name,Responsable__r.Name,Site_Web_du_projet__c,Structure__r.Name FROM Projet__c order by Date_debut__c desc ];
    	
    }
    
    @AuraEnabled
    public static list<Projet__c> findAllByStructure(String Structure){
    
    	    	return [SELECT Id,Cout__c, Date_debut__c,Date_fin_prevue__c,Description__c,Etat__c,Name,Responsable__r.Id,Responsable__r.Name,Site_Web_du_projet__c,Structure__r.Name,Structure__r.Description FROM Projet__c where Structure__c=:Structure order by Date_debut__c desc];
    	
    }
        @AuraEnabled
    public static list<Projet__c> findAllByRiskManager(String riskmanager){
    
     return [SELECT Id,Cout__c, Date_debut__c,Date_fin_prevue__c,Description__c,Etat__c,Name,Responsable__r.Name,Responsable__r.Id,Site_Web_du_projet__c,Structure__r.Name,Structure__r.Description FROM Projet__c where Responsable__c=:riskmanager and Responsable__r.RecordTypeId=:RiskManagerController.getRiskManagerRecordTypeId()  order by Date_debut__c desc];
    	
    }
     
    @AuraEnabled
    public static Projet__c add(Projet__c item){
    	if(item!=null){
    	upsert item;
    	return item;
    	}
    	return item;
    	
    }
    
    @AuraEnabled 
    public static Projet__c remove(Projet__c item){
    	delete item;
    	return item;
    }
    
    @AuraEnabled 
    public static List<Account> getEntites(){
    	
    	return[SELECT Id,Name FROM Account  where  RecordTypeId=:EntiteController.getStructureRecordTypeId()order by Name ];
    	
    }
    
    @AuraEnabled 
    public static List<Risque_Entite__c> findRisqueDetectes(String entite){
    	return [SELECT Id,Name FROM Risque_Entite__c where Entite__c=:entite];
    	
    }
    
    	@AuraEnabled
	public static List<Contact> findUserEntites(String entite){
		return [select Id,Name from Contact where AccountId=:entite];
	}

    @AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Projet__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Projet__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Projet__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        
        objectFields.put('structureLabel', SObjectType.Account.getLabel());
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }
    
    
}