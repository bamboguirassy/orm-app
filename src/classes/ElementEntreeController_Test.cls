/**
 * @author: David
 * @date: Creation: 05/06/2018
 * @description: class de test de ElementEntreeController
 */
@isTest
public class ElementEntreeController_Test {
	@testSetup
    static void setUp(){ 
        List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c>  processus = Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	Orm_TestFactory.generateElementEntree(processus[0].id); 
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
		        string  processusId=[select Id from Processus__c limit 1].Id;
		        List<ElementEntree__c> elementEntrees=ElementEntreeController.findFromProcessus(processusId);
          Test.stopTest();
          System.assertNotEquals(elementEntrees.size(),0,'ok'); 
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
      	string  processusId=[select Id from Processus__c limit 1].Id;
      	
      ElementEntree__c elementEntree= new ElementEntree__c( processus__c = processusId,Name='name');
		         ElementEntreeController.add(elementEntree);
        Test.stopTest();
        System.assertNotEquals(elementEntree.Id,null,'ok');
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
        string  processusId=[select Id from Processus__c limit 1].Id;
        Integer size=ElementEntreeController.findFromProcessus(processusId).size();
        ElementEntree__c elementEntreeId = [select Id from ElementEntree__c limit 1];
        ElementEntreeController.remove(elementEntreeId);
        Test.stopTest();
        System.assertEquals(ElementEntreeController.findFromProcessus(processusId).size(),(size-1),'ok'); 
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
        Id elementEntreeId=[select Id from ElementEntree__c limit 1].Id;
        ElementEntree__c elementEntree=ElementEntreeController.getElementById(elementEntreeId);
        Test.stopTest();
        System.assertNotEquals(elementEntree,null,'ok');      
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
        System.assertNotEquals(ElementEntreeController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}