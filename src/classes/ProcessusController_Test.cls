/**
 * @author: David
 * @date: Creation: 05/06/2018
 * @description: class de test de ProcessusController
 */
@isTest
public class ProcessusController_Test {
	@testSetup
    static void setUp(){ 
    	 List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id);       
    }
    
    /**
     * @author: David
     * @date: Creation: 05/06/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);  
        Test.startTest();
        List<Processus__c> processus=ProcessusController.findAll();
        Test.stopTest();
        System.assertNotEquals(processus.size(),0,'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 05/06/2018
     * @description: methode de test de findFromEntite
     */
    @isTest
    static void findFromEntite_Test(){
        String methodName='findFromEntite';
        System.debug('### start- '+methodName);   
        Test.startTest(); 
        id entiteId=[select id from Account limit 1].id;
        List<Processus__c> processus=ProcessusController.findFromEntite(entiteId);
        Test.stopTest();
        System.assertNotEquals(processus.size(),0,'ok');     
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
        string idEntite=[select id from Account limit 1].Id;
        string idResponsable=[select id from Contact limit 1].Id;
        Processus__c processus=new Processus__c(copilote__c=idResponsable,proprietaire__c=idEntite,pilote__c=idResponsable,
     												version__c='5',Name='processus',reference__c='reference',finalite__c='finalite',
     												dateApplication__c=System.today());  
        ProcessusController.add(processus);
          
        Test.stopTest();
        System.assertNotEquals(processus.Id,null,'ok');          
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
        Integer size=ProcessusController.findAll().size();
        Processus__c processus=[select Id from Processus__c limit 1];
        ProcessusController.remove(processus);
        Test.stopTest();
        System.assertEquals(ProcessusController.findAll().size(),(size-1),'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 05/06/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Test.startTest();
        Id processusId=[select Id from Processus__c limit 1].Id;
        Processus__c processus=ProcessusController.getElementById(processusId);
        Test.stopTest();
        System.assertNotEquals(processus,null,'ok');          
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getEntites
     */
    @isTest
    static void getEntites_Test(){
        String methodName='getEntites';
        System.debug('### start- '+methodName);  
              System.assertNotEquals(ProcessusController.getEntites().size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findUserEntites
     */
    @isTest
    static void findUserEntites_Test(){
        String methodName='findUserEntites';
        System.debug('### start- '+methodName);
         Test.startTest(); 
          string  EntiteId=[select Id from Account limit 1].Id;
          List<Contact> contact=ProcessusController.findUserEntites(EntiteId);
        Test.stopTest();
        System.assertNotEquals(contact.size(),0,'ok');        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findAllByRiskManager
     */
    @isTest
    static void findAllByRiskManager_Test(){
        String methodName='findAllByRiskManager';
        System.debug('### start- '+methodName);
                 Test.startTest(); 
          string  piloteId=[select Id from Contact limit 1].Id;
          List<Processus__c> processus=ProcessusController.findAllByRiskManager(piloteId);
        Test.stopTest();
        System.assertNotEquals(processus.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: 05/06/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST()
    {
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(ProcessusController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}