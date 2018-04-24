@IsTest
public class TestChartProcessus {
    static testMethod void test(){
        //create an entity
        Account entite=new Account();
        entite.Name='Test1';
        insert entite;
        //test user entite
        Contact userEntite=new Contact();
        userEntite.FirstName='user.Id';
        userEntite.AccountId=entite.Id;
        userEntite.LastName='true';
        insert userEntite;
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
        System.assert(ChartProcessusController.processusByEntite(annee).size()>0);
        Test.stopTest();
    }
}