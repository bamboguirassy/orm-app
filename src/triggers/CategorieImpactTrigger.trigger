trigger CategorieImpactTrigger on CategorieImpact__c (before delete) {
    
    if(Trigger.isBefore){
    	if(Trigger.isDelete){
    	
    		List<Impact_Risque_Entite__c> impactRisqueEntites = new List<Impact_Risque_Entite__c>();
    		for(CategorieImpact__c categorieImpact : Trigger.Old){
    			
    			
    		}
    	}    	
    }
}