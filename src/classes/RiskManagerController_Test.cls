/**
 * @author: Laye
 * @date: Creation: 29/05/2018
 * @description: class de test de RiskManagerController
 */
@isTest
public class RiskManagerController_Test {
	@testSetup
    static void setUp(){
    	List<Account> entites = Orm_TestFactory.generateStructure(); 
        Orm_TestFactory.generateRiskManager(entites[0].Id);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getRiskManagerRecordTypeId
     */
    @isTest
    static void getRiskManagerRecordTypeId_Test(){
        String methodName='getRiskManagerRecordTypeId';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
		Test.startTest();
        ID entiteId = [SELECT Id FROM Account limit 1].Id;
        List<Contact> responsables = RiskManagerController.findAll(entiteId);
        Test.stopTest();
        System.assertEquals(responsables.size(),20,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        ID entiteId = [SELECT Id FROM Account limit 1].Id;
		Contact contact = new Contact(Email='email@gmail.com', LastName='lastName', AccountId=entiteId);
		RiskManagerController.add(contact);
        System.assertNotEquals(contact.Id, null, 'OK');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        ID idContact = [SELECT Id FROM Contact limit 1].Id;
        System.assertNotEquals(RiskManagerController.getElementById(idContact).Id, null, 'OK');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Account entite = [SELECT Id FROM Account limit 1];    
		Integer size = RiskManagerController.findAll(entite.Id).size();
        Contact contact=[select Id from Contact limit 1];
        RiskManagerController.remove(contact);
        System.assertEquals(RiskManagerController.findAll(entite.Id).size(), size-1, 'OK');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        ID idContact = [SELECT Id FROM Contact limit 1].Id;
        System.assertNotEquals(RiskManagerController.getObjectFields().size(), null, 'OK');
        System.debug('### end- '+methodName);
    }
}