trigger PlanActionTrigger on Plan_Action__c (before delete) {
    
    if(Trigger.isBefore){
    	if(Trigger.isDelete){
    	
    		List<Activite__c> activities = new List<Activite__c>();
    		for(Plan_Action__c plan : Trigger.Old){
    			
    			activities.addAll([SELECT Id FROM Activite__c WHERE plan_Action__c=:plan.Id]);
    		}
    		delete activities;    		
    	}
    }
}