trigger ProjetTrigger on Projet__c (before delete) {
    if(Trigger.isBefore){ 
    	if(Trigger.isDelete){
    		 List<Risque_projet__c> risquesProjets = new List<Risque_projet__c>();
    		 List<IntervenantProjet__c> intervenantProjets = new List<IntervenantProjet__c>();
    		   for(Projet__c projet : Trigger.new){ 
      	  	//recuperation de la liste des 'risques projet' pour chaque projet
             risquesProjets.addAll([select Id from Risque_projet__c where Projet__c=:projet.Id]);
            intervenantProjets.addAll([select Id from IntervenantProjet__c where Project__c=:projet.Id]);
          }
         	 	delete risquesProjets;
     			delete intervenantProjets;
    		 
    	}
    }
   
}