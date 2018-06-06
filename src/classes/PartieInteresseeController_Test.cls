/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de test de PartieInteresseeController
 */
@isTest
public class PartieInteresseeController_Test {
	@testSetup
    static void setUp(){   
    		 List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c> processus=Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	List<PartieConcernee__c> partieConcernee = Orm_TestFactory.generatePartieConcernee(processus[0].Id);   
    	      Orm_TestFactory.generatePartieIntereesee(partieConcernee[0].Id);
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de findFromPartieConcernee
     */
    @isTest
    static void findFromPartieConcernee_Test(){
        String methodName='findFromPartieConcernee';
        System.debug('### start- '+methodName);
        Test.startTest(); 
		        string  partieConcerneeId=[select Id from PartieConcernee__c limit 1].Id;
		        List<PartieInteressee__c> partieInteressees=PartieInteresseeController.findFromPartieConcernee(partieConcerneeId);
          Test.stopTest();
          System.assertNotEquals(partieInteressees.size(),0,'ok');          
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
         Test.startTest();
      	string  partieConcerneeId=[select Id from PartieConcernee__c limit 1].Id;
      
      PartieInteressee__c partieInteressee= new PartieInteressee__c(PartieConcernee__c=partieConcerneeId,Name='name');
		         PartieInteresseeController.add(partieInteressee);
        Test.stopTest();
        System.assertNotEquals(partieInteressee.Id,null,'ok');       
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);  
          Test.startTest();
        Id partieInteresseeId=[select Id from PartieInteressee__c limit 1].Id;
        PartieInteressee__c partieInteressee=PartieInteresseeController.getElementById(partieInteresseeId);
        Test.stopTest();
        System.assertNotEquals(partieInteressee,null,'ok');      
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
        Test.startTest();
        string  partieConcerneeId=[select Id from PartieConcernee__c limit 1].Id;
        Integer size=PartieInteresseeController.findFromPartieConcernee(partieConcerneeId).size();
        PartieInteressee__c partieInteresseeId = [select Id from PartieInteressee__c limit 1];
        PartieInteresseeController.remove(partieInteresseeId);
        Test.stopTest();
        System.assertEquals(PartieInteresseeController.findFromPartieConcernee(partieConcerneeId).size(),(size-1),'ok');       
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 06/06/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST()
    {
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(PartieInteresseeController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}