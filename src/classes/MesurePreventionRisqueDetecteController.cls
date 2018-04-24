public with sharing class MesurePreventionRisqueDetecteController {
   
      @AuraEnabled
	public static List<Mesure_Prevention_Risque_Detecte__c> findAll(String ParamRisqueEntite){
		return [SELECT Id,mesure_Prevention__r.Name,risk_tracking_parameter__r.Risque__r.Name FROM Mesure_Prevention_Risque_Detecte__c where risk_tracking_parameter__c=:ParamRisqueEntite];
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
}