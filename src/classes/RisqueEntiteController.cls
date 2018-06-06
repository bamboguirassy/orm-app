public with sharing class RisqueEntiteController {
    @AuraEnabled
	public static List<Risque_Entite__c> findAllByEntite(String entite){
		return [SELECT Id,Date_Detection__c,Entite__r.Name,description__c,frequence__c,gravite__c,maitrise__c,criticite__c,
		               responsable__r.Name,Risque__r.Name,Entite__c,etat__c,(SELECT Id,ImpactRisque__r.Name, ImpactRisque__r.description__c,risque_Entite__r.Risque__r.Name 
		                                                                     FROM Entity_Risk_Impacts__r),
		                                                                    (SELECT Id,commentaire__c,Name 
		                                                                     FROM Action_Plans__r) 
		        FROM Risque_Entite__c 
		        WHERE Entite__c=:entite 
		        order by responsable__r.Name ];
	}
	
	@AuraEnabled
	public static List<Risque_Entite__c> findAll(){
		return [SELECT Id,Date_Detection__c,Entite__r.Name,description__c,frequence__c,gravite__c,maitrise__c,criticite__c,responsable__r.Name,Risque__r.Name,Entite__c,etat__c FROM Risque_Entite__c order by responsable__r.Name ];
	}
	
	
	 @AuraEnabled
	public static List<Risque_Entite__c> filterFromCategorieEntite(String categorie, String entite){
		return [SELECT Id,Date_Detection__c,Entite__r.Name,description__c,frequence__c,gravite__c,maitrise__c,criticite__c,responsable__r.Name,Risque__r.Name,Entite__c,Risque__r.categorieRisque__c FROM Risque_Entite__c where Entite__c=:entite and Risque__r.categorieRisque__c=:categorie order by responsable__r.Name ];
	}
	
	 @AuraEnabled
	public static List<Risque_Entite__c> filterFromCategorie(String categorie){
		return [SELECT Id,Date_Detection__c,Entite__r.Name,description__c,frequence__c,gravite__c,maitrise__c,criticite__c,responsable__r.Name,Risque__r.Name,Entite__c,Risque__r.categorieRisque__c FROM Risque_Entite__c where Risque__r.categorieRisque__c=:categorie order by responsable__r.Name ];
	}
	
	@AuraEnabled
	public static Risque_Entite__c add(Risque_Entite__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Risque_Entite__c getElementById(String Id){
		return [SELECT Id,Date_Detection__c,description__c,frequence__c,gravite__c,maitrise__c,criticite__c,
		Entite__r.Name,Entite__r.Phone,Entite__r.Website,Entite__r.Type,Entite__r.Description,Entite__c,etat__c,
		responsable__r.Name,Risque__r.Name,Risque__c FROM Risque_Entite__c where Id=:Id];
	}
	
	@AuraEnabled
	public static Risque_Entite__c remove(Risque_Entite__c item){
		delete item;
		return item;
	}
	
	@AuraEnabled
	public static List<Contact> findUserEntites(String entite){
		return [select Id,Name from Contact where AccountId=:entite];
	}
	
	@AuraEnabled
	public static List<Categorie_Risque__c> getCategorieRisques(){
		return [SELECT Id,Name FROM Categorie_Risque__c order by Name];
	}
	
	@AuraEnabled
	public static List<Risque__c> findRisques(){
		return [SELECT Id,Name FROM Risque__c order by Name]; 
	}
	
	@AuraEnabled
	public static ParamRisqueEntite__c getParamRisqueEntite(String Id){
		return [SELECT Id,risque__c,seuilApparution__c FROM ParamRisqueEntite__c where Id=:Id];
		
	}

	@AuraEnabled
	public static List<Risque_Entite__c> findAllByManagerRisk(String idRiskManager){
		return [SELECT Id,Date_Detection__c,Entite__r.Name,description__c,frequence__c,gravite__c,
		               maitrise__c,criticite__c,responsable__c,responsable__r.Name,Risque__r.Name,Entite__c,etat__c 
		               FROM Risque_Entite__c
		               where responsable__c=:idRiskManager
		               order by responsable__r.Name ];
	}
	
	@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Risque_Entite__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Risque_Entite__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Risque_Entite__c.getLabelPlural());
        //loop over description
        for (String fieldName: fieldMap.keySet()) {
           //fill variable
            objectFields.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        //get field description
       	type='Account';
         leadSchema = schemaMap.get(type);
         fieldMap = leadSchema.getDescribe().fields.getMap();
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