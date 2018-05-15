public with sharing class MesurePreventionRisqueDetecteController {
   
      @AuraEnabled
	public static List<Mesure_Prevention_Risque_Detecte__c> findAll(String ParamRisqueEntite){
		return [SELECT Id,mesure_Prevention__r.Name,risk_tracking_parameter__r.Risque__r.Name FROM Mesure_Prevention_Risque_Detecte__c 
		where risk_tracking_parameter__c=:ParamRisqueEntite order by CreatedDate desc];
	}
	
	@AuraEnabled
	public static Mesure_Prevention_Risque_Detecte__c add(Mesure_Prevention_Risque_Detecte__c item){
		upsert item;
		return item;
	}
	
	@AuraEnabled
	public static Mesure_Prevention_Risque_Detecte__c remove(Mesure_Prevention_Risque_Detecte__c item){
		delete item;
		return item;
	} 
	
	@AuraEnabled
	public static List<Mesure_Prevention__c> getMesurePreventions(String risque){
		return [SELECT Id,Name FROM Mesure_Prevention__c where Risque__c=:risque order by Name];	
	}
		@AuraEnabled
    public static Map<String,String> getObjectFields(){
        //variable for storing object field api name and field label
        Map<String,String> objectFields=new Map<String,String>();
        //field type
        String type='Mesure_Prevention_Risque_Detecte__c';
        //get field description
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        objectFields.put('label', SObjectType.Mesure_Prevention_Risque_Detecte__c.getLabel());
        objectFields.put('labelPlural', SObjectType.Mesure_Prevention_Risque_Detecte__c.getLabelPlural());
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