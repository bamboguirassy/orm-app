trigger ProcessusTrigger on Processus__c (before delete) {
   if(Trigger.isBefore){ 
      if(Trigger.isDelete){
      	  List<ProcessusRisque__c> processusRisques = new List<ProcessusRisque__c>();
      	  List<PartieConcernee__c> partieConcernees = new List<PartieConcernee__c>();
      	  List<ProcessusEntree__c> processusEntrees = new List<ProcessusEntree__c>();
      	  List<EntiteSource__c>    entiteSourcees = new List<EntiteSource__c>();
      	  for(Processus__c processus:Trigger.new){ 
      	  	//recuperation de la liste des 'risques associés' pour chaque processus
             processusRisques.addAll([select Id from ProcessusRisque__c where processus__c=:processus.Id]);
             //recuperation de la liste des 'parties concernées' pour chaque processus
             partieConcernees.addAll([select Id from PartieConcernee__c where processus__c=:processus.Id]);
             //recuperation de la liste des 'processus d'entrées' pour chaque processus
             processusEntrees.addAll([select Id from ProcessusEntree__c where processus__c=:processus.Id]);
             //recuperation de la liste des 'RESPONSIBLE ENTITIES OF INPUT ELEMENTS' pour chaque processus
             entiteSourcees.addAll([select Id from EntiteSource__c where processus__c=:processus.Id]);
          }
          // suppression des listes associées
     delete processusRisques;
     delete partieConcernees;
     delete processusEntrees;
     delete entiteSourcees;
      }
   }  
}