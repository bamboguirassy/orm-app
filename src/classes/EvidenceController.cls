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
	public static Evidence__c getElementByIdPreuve(String Id){
		return [SELECT Id,webRessource__c, description__c,Name FROM Evidence__c where Id=:Id];
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

	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Evidence__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Evidence__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Evidence__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        //return map with fields api name as key and field label as value
        System.debug('###-result'+objectFields);
        return objectFields;
    }


}