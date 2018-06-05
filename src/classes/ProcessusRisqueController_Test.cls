/**
 * @author: David
 * @date: Creation: 05/06/2018
 * @description: class de test de ProcessusRisqueController
 */
@isTest
public class ProcessusRisqueController_Test {
	@testSetup
    static void setUp(){   
    	List<Account> structures = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);    	
    	List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
    	List<Risque_Entite__c> risqueEntite=Orm_TestFactory.generateRisqueDetecte(risques[0].Id, responsables[0].Id,  structures[0].Id);
    	List<Processus__c> processus = Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id);  
    	Orm_TestFactory.generateProcessusRisque(processus[0].id,risqueEntite[0].id);
    	     
    }
    
    /**
     * @author: David
     * @date: Creation: 05/06/2018
     * @description: methode de test de findFromProcessus
     */
    @isTest
    static void findFromProcessus_Test(){
        String methodName='findFromProcessus';
        System.debug('### start- '+methodName);
         Test.startTest(); 
        id idProcessus=[select id from Processus__c limit 1].id;
        List<ProcessusRisque__c> processusRisque=ProcessusRisqueController.findFromProcessus(idProcessus);
        Test.stopTest();
        System.assertNotEquals(processusRisque.size(),0,'ok');        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 05/06/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);  
        Test.startTest();
        string idRisque=[select id from risque_Entite__c limit 1].Id;
        string idProcessus=[select id from Processus__c limit 1].Id;
        ProcessusRisque__c processusRisque=new ProcessusRisque__c(processus__c=idProcessus,risqueEntite__c=idRisque);
        ProcessusRisqueController.add(processusRisque);
        Test.stopTest();
        System.assertNotEquals(processusRisque.Id,null,'ok');          
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 05/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
         id idProcessus=[select id from Processus__c limit 1].id;
        Integer size=ProcessusRisqueController.findFromProcessus(idProcessus).size();
        ProcessusRisque__c processusRisque=[select Id from ProcessusRisque__c limit 1];
        ProcessusRisqueController.remove(processusRisque);
        Test.stopTest();
        System.assertEquals(ProcessusRisqueController.findFromProcessus(idProcessus).size(),(size-1),'ok');           
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getRisqueEntites
     */
    @isTest
    static void getRisqueEntites_Test(){
        String methodName='getRisqueEntites';
        System.debug('### start- '+methodName); 
         Test.startTest();
        string  EntiteId=[select Id from Account limit 1].Id;
        List<Risque_Entite__c> risqueEntite=ProcessusRisqueController.getRisqueEntites(EntiteId);
        Test.stopTest();
        System.assertNotEquals(risqueEntite,null,'ok');       
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST()
    {
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(ProcessusRisqueController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}