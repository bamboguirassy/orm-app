trigger RisqueTrigger on Risque__c (before insert,before update,before delete) 
{
    	if(Trigger.isBefore)
    { 
    	if(Trigger.isDelete)
    	{
    		 List<Mesure_Prevention__c> mesurePreventions= new List<Mesure_Prevention__c>();
    		 List<Impact__c> impacts = new List<Impact__c>();
    		 for(Risque__c risque: Trigger.old)
    		   	{ 
		      	  	//recuperation de la liste des 'risques projet' pour chaque projet
		             mesurePreventions.addAll([select Id,Risque__c from Mesure_Prevention__c where Risque__c=:risque.Id]);
		             impacts.addAll([select Id,risque__c from Impact__c where risque__c=:risque.Id]);
        	  	}
         	 		 delete mesurePreventions;
     				 delete impacts;
     	}
    }  
    
}