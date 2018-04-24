public with sharing class IntervenantProjetController {
    
    @AuraEnabled
    public static List<IntervenantProjet__c> findAll(String projet){
    	return [select Id, Intervenant__c, Intervenant__r.Name, Intervenant__r.Phone, 
		    	Intervenant__r.Email, Role__c, Project__r.Structure__c 
		    	from IntervenantProjet__c  
		    	where Project__c=:projet order by Intervenant__r.Name];
    }
    
    
    @AuraEnabled
    public static List<Contact> getIntervenants(String structureId){
    	return [SELECT Name, Id, Phone, Email FROM Contact WHERE AccountId =: structureId
    	ORDER BY Name];
    }
    
    @AuraEnabled
    public static List<Contact> getIntervenantsEdit(String structureId, String idIntervenant){
    	return [SELECT Name, Id, Phone, Email FROM Contact WHERE (AccountId =: structureId and Id<>:idIntervenant)
    	ORDER BY Name];
    }
    
    @AuraEnabled
    public static void add(IntervenantProjet__c item){
    	upsert item;
    }
    
     @AuraEnabled
    public static void remove(IntervenantProjet__c item){
    	delete item;
    }
    
    @AuraEnabled
	public static IntervenantProjet__c getElementById(String Id){
		return [select Id, Intervenant__c, Intervenant__r.Name, Role__c
		    	from IntervenantProjet__c where Id=:Id];
	}
}