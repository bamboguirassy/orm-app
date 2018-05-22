trigger RisqueTrigger on Risque__c (before delete) 
{
    	if(Trigger.isBefore)
    { 
    	if(Trigger.isDelete)
    	{
    		 List<Mesure_Prevention__c> mesurePreventions= new List<Mesure_Prevention__c>();
    		 List<Impact__c> impacts = new List<Impact__c>();
    		 List<Risque_Entite__c> risqueEntites = new List<Risque_Entite__c>();
    		 List<ParamRisqueEntite__c> paramRisqueEntites=new List<ParamRisqueEntite__c>();
    		 for(Risque__c risque: Trigger.old)
    		   	{ 
		      	     mesurePreventions.addAll([select Id from Mesure_Prevention__c where Risque__c=:risque.Id]);
		             impacts.addAll([select Id from Impact__c where risque__c=:risque.Id]);
		             risqueEntites.addAll([select Id from Risque_Entite__c where Risque__r.Id=:risque.Id]);
		             paramRisqueEntites.addAll([select Id from ParamRisqueEntite__c where risque__r.Id=:risque.Id]);
        	  	}
         	 		 delete mesurePreventions;
     				 delete impacts;
     				 delete risqueEntites;
     				 delete paramRisqueEntites;	
     	}
    }   
}