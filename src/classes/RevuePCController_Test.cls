/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de test de RevuePCController
 */
@isTest
public class RevuePCController_Test {
	@testSetup
    static void setUp(){   
    	List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c> processus=Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	List<PartieConcernee__c> partieConcernee = Orm_TestFactory.generatePartieConcernee(processus[0].Id);   
    	      Orm_TestFactory.generateRevuePC(partieConcernee[0].Id);     
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de findFromProcessus
     */
    @isTest
    static void findFromPartieConcernee_Test(){
        String methodName='findFromPartieConcernee';
        System.debug('### start- '+methodName); 
        Test.startTest(); 
		        string  partieConcerneeId=[select Id from PartieConcernee__c limit 1].Id;
		        List<RevuePC__c> revuePCs=RevuePCController.findFromPartieConcernee(partieConcerneeId);
        Test.stopTest();
        System.assertNotEquals(revuePCs.size(),0,'ok');        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
      	string  partieConcerneeId=[select Id from PartieConcernee__c limit 1].Id;
      
      RevuePC__c revuePC= new RevuePC__c(PartieConcernee__c=partieConcerneeId,Name='name');
		         RevuePCController.add(revuePC);
        Test.stopTest();
        System.assertNotEquals(revuePC.Id,null,'ok');          
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName); 
         Test.startTest();
        string  partieConcerneeId=[select Id from PartieConcernee__c limit 1].Id;
        Integer size=RevuePCController.findFromPartieConcernee(partieConcerneeId).size();
        RevuePC__c revuePCId = [select Id from RevuePC__c limit 1];
        RevuePCController.remove(revuePCId);
        Test.stopTest();
        System.assertEquals(RevuePCController.findFromPartieConcernee(partieConcerneeId).size(),(size-1),'ok');       
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
        Id revuePCId=[select Id from RevuePC__c limit 1].Id;
        RevuePC__c revuePC=RevuePCController.getElementById(revuePCId);
        Test.stopTest();
        System.assertNotEquals(revuePC,null,'ok');      
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
        System.assertNotEquals(RevuePCController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}