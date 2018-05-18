trigger RisqueEntite on Risque_Entite__c (before delete) {
   if(Trigger.isBefore){ 
      if(Trigger.isDelete){
          List<Impact_Risque_Entite__c> impactRisqueEntites = new List<Impact_Risque_Entite__c>();
          List<Plan_Action__c>          planActions = new List<Plan_Action__c>();
          List<CauseRisqueDetecte__c>   causeRisqueDetectes = new List<CauseRisqueDetecte__c>();
          List<Entite_Affectee__c>      entiteAffectees = new List<Entite_Affectee__c>();
          
          for(Risque_Entite__c risqueEntite:Trigger.old){ 
            //recuperation de la liste des 'impacts risques' pour chaque Risque_Entite
             impactRisqueEntites.addAll([select Id from Impact_Risque_Entite__c where risque_Entite__c=:risqueEntite.Id]);
             //recuperation de la liste des 'plans d actions' pour chaque Risque_Entite
             planActions.addAll([select Id from Plan_Action__c where risque_Entite__c=:risqueEntite.Id]);
             //recuperation de la liste des 'causes risques detec' pour chaque Risque_Entite
             causeRisqueDetectes.addAll([select Id from CauseRisqueDetecte__c where risqueEntite__c=:risqueEntite.Id]);
             //recuperation de la liste des 'entite affectees' pour chaque Risque_Entite
             entiteAffectees.addAll([select Id from Entite_Affectee__c where risque_Entite__c=:risqueEntite.Id]);
          }
          // suppression des listes associées
         delete impactRisqueEntites;
         delete planActions;
         delete causeRisqueDetectes;
         delete entiteAffectees;
      }
   }  
}