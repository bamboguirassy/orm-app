@IsTest
public class TestChartChartRisque {
    static testMethod void test(){
        //test categorie risque
        Categorie_Risque__c categorieRisque=new Categorie_Risque__c();
        categorieRisque.Name='Categorie de Test';
        CategorieRisqueController.add(categorieRisque);
        //test risque
        Risque__c risque=new Risque__c();
        risque.categorieRisque__c=categorieRisque.Id;
        risque.Name='Risque de test';
        RisqueController.add(risque);
        //create an entity
        Account entite=new Account();
        entite.Name='Test1';
        insert entite;
        //test user entite
        Contact userEntite=new Contact();
        userEntite.FirstName='user.Id';
        userEntite.LastName='FOfana';
        userEntite.AccountId=entite.Id;
        insert userentite;
        //test de processus
        Processus__c processus=new Processus__c();
        processus.Name='Processus de test';
        processus.proprietaire__c=entite.Id;
        processus.pilote__c=userEntite.Id;
        processus.reference__c='REF 10.5';
        processus.version__c='5.1';
        processus.dateApplication__c=System.today();
        System.assert(ProcessusController.add(processus).Id!=null);
        
        Test.startTest();
        String annee='2017';
        System.assert(ChartRisqueController.entiteAffecteeByRisque(risque.Id, annee).size()>0);
        System.assert(ChartRisqueController.findCategorieRisques().size()>0);
        System.assert(ChartRisqueController.findEntites().size()>0);
        System.assert(ChartRisqueController.findRisques().size()>0);
        System.assert(ChartRisqueController.risqueAssocieProcessusByEntite(entite.Id, annee).size()>0);
        System.assert(ChartRisqueController.risqueByCategorie(entite.Id, annee).size()>0);
        System.assert(ChartRisqueController.risqueByEntite(categorieRisque.Id, annee).size()>0);
        System.assert(ChartRisqueController.risqueByEntiteAnnee(annee).size()>0);
        System.assert(ChartRisqueController.risqueByUser(entite.Id, annee).size()>0);
        System.assert(ChartRisqueController.risqueEntiteByCotationByEntite(entite.Id, annee).size()>0);
        System.assert(ChartRisqueController.risqueEntiteByRisque(risque.Id, annee).size()>0);
        
		Test.stopTest();
    }
}