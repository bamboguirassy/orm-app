public with sharing class  RisqueProjetController {
	
	@AuraEnabled
	public static List<Risque_projet__c> findAll(String projet){
     return [SELECT Id,Risque_detecte__r.Risque__r.Name,Risque_detecte__r.Date_Detection__c,Risque_detecte__r.etat__c,Risque_detecte__r.criticite__c FROM Risque_projet__c where Projet__c=:projet];
		
	}
	
	    @AuraEnabled 
	public static List<Risque_Entite__c> getRisqueEntites(String entite){
		return [SELECT Id,Risque__r.Name FROM Risque_Entite__c where Entite__c=:entite order by Risque__r.Name ];
	}
	
	    
    @AuraEnabled
    public static Risque_projet__c add(Risque_projet__c item){
    	upsert item;
    	return item;
    	
    }
    
    @AuraEnabled 
    public static Risque_projet__c remove(Risque_projet__c item){
    	delete item;
    	return item;
    }
    
    
}