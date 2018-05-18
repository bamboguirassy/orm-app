trigger RisqueTrigger on Risque__c (before delete) 
{
    	if(Trigger.isBefore)
    { 
    	if(Trigger.isDelete)
    	{
    		 List<Mesure_Prevention__c> mesurePreventions= new List<Mesure_Prevention__c>();
    		 List<Impact__c> impacts = new List<Impact__c>();
    		 List<Risque_Entite__c> risqueEntite = new List<Risque_Entite__c>();
    		// List<Risque_projet__c> risqueProjet = new List<Risque_projet__c>();
    		 for(Risque__c risque: Trigger.old)
    		   	{ 
		      	     mesurePreventions.addAll([select Id,Risque__c from Mesure_Prevention__c where Risque__c=:risque.Id]);
		             impacts.addAll([select Id,risque__c from Impact__c where risque__c=:risque.Id]);
		             risqueEntite.addAll([select Id,Risque__r.Id from Risque_Entite__c where Risque__r.Id=:risque.Id]);
		           //  risqueProjet.addAll([select Id,Risque_detecte__r.Risque__r.Id from Risque_projet__c where Risque_detecte__r.Risque__r.Id=:risque.Id]);
        	  	}
         	 		 delete mesurePreventions;
     				 delete impacts;
     				 delete risqueEntite;
     				// delete risqueProjet;
     	}
    }  
    
}