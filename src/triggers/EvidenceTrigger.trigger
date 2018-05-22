trigger EvidenceTrigger on Evidence__c (before delete) {
    
    if(Trigger.isBefore){
    	if(Trigger.isDelete){
    		List<ContentDocumentLink> cdls= new List<ContentDocumentLink>();    		
    		for(Evidence__c evidence : Trigger.Old){
    			cdls.addAll([select ContentDocumentId from ContentDocumentLink where LinkedEntityId = :evidence.Id]);  
    		}
    		
    		set <Id> idcds = new set <Id> ();
	        for(ContentDocumentLink cdl:cdls ){
	            idcds.add(cdl.ContentDocumentId);
	        }
	        List<ContentDocument> cds= new List<ContentDocument>();   
	        cds.addAll([SELECT Id,Title,ParentId from ContentDocument where Id IN :idcds ]);
	        
	        delete cds;
    	}
    }
}