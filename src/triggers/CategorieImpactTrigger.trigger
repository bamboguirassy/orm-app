trigger CategorieImpactTrigger on CategorieImpact__c (before delete) {
    
    if(Trigger.isBefore){
    	if(Trigger.isDelete){
    	
    		List<Impact__c> impactRisques = new List<Impact__c>();
    		
    		for(CategorieImpact__c categorieImpact : Trigger.Old){
    		   //recuperation de la liste des 'impacts' pour chaque CategorieImpact
               impactRisques.addAll([select Id from Impact__c where Categorie_Impact__c=:categorieImpact.Id]);    			
    		}
    		
    		// suppression des listes impactes associes
    		delete impactRisques;
    	}    	
    }
}