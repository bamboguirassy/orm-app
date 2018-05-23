trigger ParamRisqueEntite on ParamRisqueEntite__c (before delete) {
    if(Trigger.isBefore){ 
      if(Trigger.isDelete){
          List<Mesure_Prevention_Risque_Detecte__c> mesurePreventions = new List<Mesure_Prevention_Risque_Detecte__c>();
          List<Plan_Action__c> planActions = new List<Plan_Action__c>();
          List<PREtracker__c> pREtrackers = new List<PREtracker__c>();
          
          for(ParamRisqueEntite__c paramRisqueEntite:Trigger.old){ 
	            mesurePreventions.addAll([select Id from Mesure_Prevention_Risque_Detecte__c where 	risk_tracking_parameter__c=:paramRisqueEntite.Id]);
                planActions.addAll([select Id from Plan_Action__c where ParamRisqueEntite__c=:paramRisqueEntite.Id and RecordTypeId=:PlanActionPreventifController.getPlanActionPreventifRecordTypeId()]);   
                pREtrackers.addAll([select Id from PREtracker__c where 	ParamRisqueEntite__c=:paramRisqueEntite.Id]);
          }
          
         delete mesurePreventions;
         delete planActions;
         delete pREtrackers;        
      }
   }  
}