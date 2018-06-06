/**
 * @author: David
 * @date: Creation: 05/06/2018
 * @description: class de test de PartieConcerneeController
 */
@isTest
public class PartieConcerneeController_Test {
    @testSetup
    static void setUp(){   
    	 List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c> processus=Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	Orm_TestFactory.generatePartieConcernee(processus[0].Id);     
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
        List<PartieConcernee__c> partieConcernees=PartieConcerneeController.findFromProcessus(processusId);
        Test.stopTest();
        System.assertNotEquals(partieConcernees.size(),0,'ok');        
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
      PartieConcernee__c partieConcernee= new PartieConcernee__c(processus__c=processusId,Name='name');
		         PartieConcerneeController.add(partieConcernee);
        Test.stopTest();
        System.assertNotEquals(partieConcernee.Id,null,'ok');    
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
        Integer size=PartieConcerneeController.findFromProcessus(processusId).size();
        PartieConcernee__c partieConcerneeId = [select Id from PartieConcernee__c limit 1];
        PartieConcerneeController.remove(partieConcerneeId);
        Test.stopTest();
        System.assertEquals(PartieConcerneeController.findFromProcessus(processusId).size(),(size-1),'ok');       
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
        Id partieConcerneeId=[select Id from PartieConcernee__c limit 1].Id;
        PartieConcernee__c partieConcernee=PartieConcerneeController.getElementById(partieConcerneeId);
        Test.stopTest();
        System.assertNotEquals(partieConcernee,null,'ok');       
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
        System.assertNotEquals(PartieConcerneeController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    } 
}