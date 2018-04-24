public with sharing class EvidenceController {
      @AuraEnabled
    public static List<Evidence__c> findAll(String mesure){
    	return [select Id, Name, webRessource__c, evidenceOfActivity__c, description__c, evidenceOfActivity__r.Name from Evidence__c where evidenceOfActivity__c=:mesure];
    	
    }
       @AuraEnabled
    public static List<Evidence__c> findAllByActivity(String activite){
    	return [SELECT Id,Name,webRessource__c,evidenceOfActivity__c,description__c,evidenceOfActivity__r.Name,evidenceOfActivity__r.activite__c FROM Evidence__c where evidenceOfActivity__r.activite__c=:activite];
    	
    }
    

    	@AuraEnabled
	public static Evidence__c add (Evidence__c item){
		upsert item;
		return item;
	}
		@AuraEnabled
	public static Evidence__c remove(Evidence__c item){
		delete item;
		return item;
	}
	 @AuraEnabled
     public static List<ContentDocument> findAllContentDocument(String activite){
     	List<Mesure__c> mesures =new List<Mesure__c>();
     	List <Evidence__c> preuves=new List<Evidence__c>();
     	List<ContentDocumentLink> cdls= new List<ContentDocumentLink>();
     	mesures=MesureController.findAll(activite);
    for(Mesure__c mesure:mesures){
     	     preuves.addAll(EvidenceController.findAll(mesure.Id));

     	}
     	for(Evidence__c preuve:preuves){
     		 cdls.addAll([select ContentDocumentId from ContentDocumentLink 
     where LinkedEntityId=:preuve.Id]);
     	
     	}
     	
     	set <Id> idcds = new set <Id> ();
     	for(ContentDocumentLink cdl:cdls ){
     		idcds.add(cdl.ContentDocumentId);
     	}
     	//return cdls;
     	return [SELECT Id,Title,ParentId from ContentDocument where Id IN :idcds ];
}

	
 @AuraEnabled
     public static List<ContentDocument> findAllContentDocumentByMesure(String preuve){
      List <Evidence__c> preuves=new List<Evidence__c>();
        List<ContentDocumentLink> cdls= new List<ContentDocumentLink>();
      preuves.add([select Id from Evidence__c where Id=:preuve]);
      
        for(Evidence__c pid:preuves ){
         
             cdls.addAll([select ContentDocumentId from ContentDocumentLink where LinkedEntityId =:pid.Id]);     
        }
            
       set <Id> idcds = new set <Id> ();
        for(ContentDocumentLink cdl:cdls ){
            idcds.add(cdl.ContentDocumentId);
        }
        
        return [SELECT Id,Title,ParentId from ContentDocument where Id IN :idcds ];
}



}