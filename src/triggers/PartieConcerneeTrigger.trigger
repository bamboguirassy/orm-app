trigger PartieConcerneeTrigger on PartieConcernee__c (before delete) {
    
    	if(Trigger.isBefore)
    { 
    	if(Trigger.isDelete)
    	{
    		 List<PartieInteressee__c> partieInteressee= new List<PartieInteressee__c>();
    		 List<ImpactPC__c> impactPC = new List<ImpactPC__c>();
    		 List<ModeSurveillancePC__c> modeSurveillancePC = new List<ModeSurveillancePC__c>();
    		 List<RevuePC__c> revuePC=new List<RevuePC__c>();
    		 List<ExigencePC__c> exigencePC=new List<ExigencePC__c>();
    		 List<CritereEfficacitePC__c> critereEfficacitePC=new List<CritereEfficacitePC__c>();
    		 for(PartieConcernee__c partieConcernee: Trigger.old)
    		   	{ 
		      	     partieInteressee.addAll([select Id from PartieInteressee__c where PartieConcernee__c=:partieConcernee.Id]);
		             impactPC.addAll([select Id from ImpactPC__c where PartieConcernee__c=:partieConcernee.Id]);
		             modeSurveillancePC.addAll([select Id from ModeSurveillancePC__c where PartieConcernee__c=:partieConcernee.Id]);
		             revuePC.addAll([select Id from RevuePC__c where PartieConcernee__c=:partieConcernee.Id]);
		             exigencePC.addAll([select Id from ExigencePC__c where PartieConcernee__c=:partieConcernee.Id]);
		             critereEfficacitePC.addAll([select Id from CritereEfficacitePC__c where PartieConcernee__c=:partieConcernee.Id]);

        	  	}
         	 		delete partieInteressee;
         	 		delete impactPC;
         	 		delete modeSurveillancePC;
         	 		delete revuePC;
         	 		delete exigencePC;
         	 		delete critereEfficacitePC;
     	}
    }   
    
}