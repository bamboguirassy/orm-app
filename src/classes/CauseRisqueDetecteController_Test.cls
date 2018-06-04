/**
 * @author: David
 * @date: Creation: 04/06/2018
 * @description: class de teste de CauseRisqueDetecteController
 */
@isTest
public class CauseRisqueDetecteController_Test {
	 @testSetup
    static void setup()
    {
    	List<Account> structures = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);    	
    	List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
    	List<Risque_Entite__c> risqueDetecte =Orm_TestFactory.generateRisqueDetecte(risques[0].Id, responsables[0].Id,  structures[0].Id);
		Orm_TestFactory.generateCauseRisqueDetecte(risqueDetecte[0].Id);
    }
    
    /**
     * @author: David
     * @date: 04/06/2018
     * @descrition: recuperer la liste des causes risque detecte
     */
    @isTest
    static void findAll_TEST(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Test.startTest();
        string risqueEntite = [select id from Risque_Entite__c limit 1].Id;
        List<CauseRisqueDetecte__c> causeRisqueDetectes=CauseRisqueDetecteController.findAll(risqueEntite);
        Test.stopTest();
        System.assertNotEquals(causeRisqueDetectes.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 04/06/2018
     * @descrition:  
     */
    @isTest
    static void add_TEST(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
        string risqueEntite = [select id from Risque_Entite__c limit 1].Id;
        CauseRisqueDetecte__c CauseRisqueDetecte=new CauseRisqueDetecte__c(Name='risque de test',Description__c='description',risqueEntite__c=risqueEntite);
        CauseRisqueDetecteController.add(CauseRisqueDetecte);
        Test.stopTest();
        System.assertNotEquals(CauseRisqueDetecte.Id,null,'ok');
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 04/06/2018
     * @descrition:  
     */
    @isTest
    static void remove_TEST(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
        string risqueEntite = [select id from Risque_Entite__c limit 1].Id;
        Integer size=CauseRisqueDetecteController.findAll(risqueEntite).size();
        CauseRisqueDetecte__c CauseRisqueDetecte=[select Id from CauseRisqueDetecte__c limit 1];
        CauseRisqueDetecteController.remove(CauseRisqueDetecte);
        Test.stopTest();
        System.assertEquals(CauseRisqueDetecteController.findAll(risqueEntite).size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition: 
     */
    @isTest
    static void getElementById_TEST(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Test.startTest();
        Id CauseRisqueDetecteId =[select Id from CauseRisqueDetecte__c limit 1].Id;
        CauseRisqueDetecte__c CauseRisqueDetecte=CauseRisqueDetecteController.getElementById(CauseRisqueDetecteId);
        Test.stopTest();
        System.assertNotEquals(CauseRisqueDetecte,null,'ok');
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
       System.assertNotEquals(CauseRisqueDetecteController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }

}