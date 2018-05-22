trigger RiskManager on Contact (before delete) {
   if(Trigger.isBefore){ 
      if(Trigger.isDelete){
          List<Projet__c> projets = new List<Projet__c>();
         // List<Projet__c> projets = new List<Projet__c>();
          
          
          for(Contact riskManager:Trigger.old){ 
          	if(RiskManagerController.getRiskManagerRecordTypeId() == riskManager.RecordTypeId){
	          	//recuperation de la liste des 'projets' pour chaque RiskManager
	            projets.addAll([select Id from Projet__c where Responsable__c=:riskManager.Id]);
	            //recuperation de la liste des 'ChartStatistiqueRiskManager' pour chaque RiskManager
                //projets.addAll([select Id from Projet__c where Responsable__c=:riskManager.Id]);
          	}
            
          }
          // suppression des listes associées
         delete projets;
         //delete projets;
         
      }
   }  
}