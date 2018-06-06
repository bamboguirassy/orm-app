/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de test de ModeSurveillancePCController
 */
@isTest
public class ModeSurveillancePCController_Test {
	@testSetup
    static void setUp(){  
    	List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c> processus=Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	List<PartieConcernee__c> partieConcernee = Orm_TestFactory.generatePartieConcernee(processus[0].Id);   
    	      Orm_TestFactory.generateModeSurveillancePC(partieConcernee[0].Id);      
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
		        List<ModeSurveillancePC__c> modeSurveillancePCs=ModeSurveillancePCController.findFromPartieConcernee(partieConcerneeId);
          Test.stopTest();
          System.assertNotEquals(modeSurveillancePCs.size(),0,'ok');       
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
      
      ModeSurveillancePC__c modeSurveillancePC= new ModeSurveillancePC__c(PartieConcernee__c=partieConcerneeId,Name='name');
		         ModeSurveillancePCController.add(modeSurveillancePC);
        Test.stopTest();
        System.assertNotEquals(modeSurveillancePC.Id,null,'ok');         
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
        Integer size=ModeSurveillancePCController.findFromPartieConcernee(partieConcerneeId).size();
        ModeSurveillancePC__c modeSurveillancePCId = [select Id from ModeSurveillancePC__c limit 1];
        ModeSurveillancePCController.remove(modeSurveillancePCId);
        Test.stopTest();
        System.assertEquals(ModeSurveillancePCController.findFromPartieConcernee(partieConcerneeId).size(),(size-1),'ok');        
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
        Id modeSurveillancePCId=[select Id from ModeSurveillancePC__c limit 1].Id;
        ModeSurveillancePC__c modeSurveillancePC=ModeSurveillancePCController.getElementById(modeSurveillancePCId);
        Test.stopTest();
        System.assertNotEquals(modeSurveillancePC,null,'ok');         
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
        System.assertNotEquals(ModeSurveillancePCController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}