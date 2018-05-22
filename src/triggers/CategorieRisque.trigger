trigger CategorieRisque on Categorie_Risque__c (before insert) {
     if(Trigger.isBefore){
    	if(Trigger.isDelete){
    	
    		List<Risque__c> risques = new List<Risque__c>();
    		
    		for(Categorie_Risque__c categorieRisque : Trigger.Old){
    		   //recuperation de la liste des 'risques' pour chaque CategorieRisque
               risques.addAll([select Id from Risque__c where categorieRisque__c=:categorieRisque.Id]);    			
    		}
    		
    		// suppression des listes risques associes
    		delete risques;
    	}    	
    }
}