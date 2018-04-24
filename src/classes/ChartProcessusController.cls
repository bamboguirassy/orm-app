public with sharing class ChartProcessusController {
    @AuraEnabled
	public static  Map<String, Object> processusByEntite(String annee){
		List<Account> entites= [SELECT Id,Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Id];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		for(Account entite:entites){
			labels.add(entite.Name);
			AggregateResult result=[SELECT count(Id) FROM Processus__c where proprietaire__c=:entite.Id  and CALENDAR_YEAR(dateApplication__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
}