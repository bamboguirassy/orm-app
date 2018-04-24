public with sharing class ChartRisqueController {
	@AuraEnabled
	public static List<Account> findEntites(){
		return [SELECT Id,Name,Parent.Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Name];
	}
	
	@AuraEnabled
	public static List<Risque__c> findRisques(){
		return [SELECT Id,Name FROM Risque__c order by Name];
	}
	
	@AuraEnabled
	public static List<Categorie_Risque__c> findCategorieRisques(){
				return [SELECT Name,Id FROM Categorie_Risque__c  order by Name];
	}
	
	@AuraEnabled
	public static  Map<String, Object> risqueByCategorie(String entite, String annee){
		List<Categorie_Risque__c> categories=[SELECT Name,Id FROM Categorie_Risque__c  order by Id];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		for(Categorie_Risque__c categorie:categories){
			labels.add(categorie.Name);
			AggregateResult result=[SELECT count(Id) FROM Risque_Entite__c where Entite__c=:entite and Risque__r.categorieRisque__c=:categorie.Id and CALENDAR_YEAR(Date_Detection__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
	
	@AuraEnabled
	public static  Map<String, Object> risqueByEntite(String categorie, String annee){
		List<Account> entites= [SELECT Id,Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Id];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		for(Account entite:entites){
			labels.add(entite.Name);
			AggregateResult result=[SELECT count(Id) FROM Risque_Entite__c where Entite__c=:entite.Id and Risque__r.categorieRisque__c=:categorie and CALENDAR_YEAR(Date_Detection__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
	
	@AuraEnabled
	public static  Map<String, Object> risqueByEntiteAnnee(String annee){
		List<Account> entites= [SELECT Id,Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Id];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		for(Account entite:entites){
			labels.add(entite.Name);
			AggregateResult result=[SELECT count(Id) FROM Risque_Entite__c where Entite__c=:entite.Id and CALENDAR_YEAR(Date_Detection__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
	
	@AuraEnabled
	public static  Map<String, Object> risqueByUser(String entite, String annee){
		List<Contact> users=[SELECT Id,Name FROM Contact where AccountId=:entite order by Name];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		for(Contact user:users){
			labels.add(user.Name);
			AggregateResult result=[SELECT count(Id) FROM Risque_Entite__c where Entite__c=:entite and responsable__r.Id=:user.Id and CALENDAR_YEAR(Date_Detection__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
	
	@AuraEnabled
	public static  Map<String, Object> risqueAssocieProcessusByEntite(String entite, String annee){
		List<Processus__c> processuss=[SELECT Id,Name FROM Processus__c where proprietaire__c=:entite order by Name];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		for(Processus__c processus:processuss){
			labels.add(processus.Name);
			AggregateResult result=[SELECT count(Id) FROM ProcessusRisque__c where processus__c=:processus.Id and CALENDAR_YEAR(processus__r.dateApplication__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
	
	@AuraEnabled
	public static  Map<String, Object> risqueEntiteByRisque(String risque, String annee){
		List<Account> entites= [SELECT Id,Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Name];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		for(Account entite:entites){
			labels.add(entite.Name);
			AggregateResult result=[SELECT count(Id) FROM Risque_Entite__c where entite__c=:entite.Id and risque__r.Id=:risque and CALENDAR_YEAR(Date_Detection__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
	
	@AuraEnabled
	public static  Map<String, Object> entiteAffecteeByRisque(String risque, String annee){
		List<Account> entites= [SELECT Id,Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Name];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		for(Account entite:entites){
			labels.add(entite.Name);
			AggregateResult result=[SELECT count(Id) FROM Entite_Affectee__c where Entite__c=:entite.Id and risque_Entite__r.Risque__r.Id=:risque and CALENDAR_YEAR(risque_Entite__r.Date_Detection__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
	
	
    @AuraEnabled
	public static  Map<String, Object> risqueEntiteByCotationByEntite(String entite, String annee){
		List<Account> entites= [SELECT Id,Name FROM Account where RecordTypeId=:EntiteController.getStructureRecordTypeId() order by Name];
		List<String> labels=new List<String>{};
		List<Integer> datas=new List<Integer>{};
		Integer i=1;
		for(; i<=16;i++){
			labels.add(''+i);
			AggregateResult result=[SELECT count(Id) FROM Risque_Entite__c where entite__c=:entite and criticite__c=:i and CALENDAR_YEAR(Date_Detection__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		}
		
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
	
	@AuraEnabled
	public static  Map<String, Object> statistiqueRiskManager(String riskManagerId, String annee){
		List<String> labels=new List<String>{'Pilote Processus','Copilote Processus','Responsable Projet','Gestionnaire Risque','Intervenant Projet'};
		List<Integer> datas=new List<Integer>{};
		Integer i=1;
		//pilote processus
			AggregateResult result=[SELECT count(Id) FROM Processus__c where pilote__c=:riskManagerId and CALENDAR_YEAR(dateApplication__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
		//copilote processus
		 result=[SELECT count(Id) FROM Processus__c where copilote__c=:riskManagerId and CALENDAR_YEAR(dateApplication__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
			//responsable projet
		 result=[SELECT count(Id) FROM Projet__c where Responsable__c=:riskManagerId and CALENDAR_YEAR(Date_debut__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
			//gestionnaire de risque
			result=[SELECT count(Id) FROM Risque_Entite__c where responsable__c=:riskManagerId and CALENDAR_YEAR(Date_Detection__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
			//intervenant projet
			result=[SELECT count(Id) FROM IntervenantProjet__c where Intervenant__c=:riskManagerId and CALENDAR_YEAR(Project__r.Date_debut__c)=:Integer.valueOf(annee)];
			datas.add(Integer.valueOf(result.get('expr0')));
			
		return new Map<String, Object>{'labels' => labels, 'data' => datas};
	
	}
}