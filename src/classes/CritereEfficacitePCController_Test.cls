/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de teste de CritereEfficacitePCController
 */
@isTest
public class CritereEfficacitePCController_Test {
	@testSetup
    static void setUp(){ 
    	 List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c> processus=Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	List<PartieConcernee__c> partieConcernee = Orm_TestFactory.generatePartieConcernee(processus[0].Id);   
    	      Orm_TestFactory.generateCritereEfficacitePC(partieConcernee[0].Id);       
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
		        List<CritereEfficacitePC__c> critereEfficacitePCs = CritereEfficacitePCController.findFromPartieConcernee(partieConcerneeId);
          Test.stopTest();
          System.assertNotEquals(critereEfficacitePCs.size(),0,'ok');  
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
          Test.startTest();
      	string  partieConcerneeId=[select Id from PartieConcernee__c limit 1].Id;
      CritereEfficacitePC__c critereEfficacitePC= new CritereEfficacitePC__c(PartieConcernee__c=partieConcerneeId,Name='name');
		         CritereEfficacitePCController.add(critereEfficacitePC);
        Test.stopTest();
        System.assertNotEquals(critereEfficacitePC.Id,null,'ok');  
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
        Integer size=CritereEfficacitePCController.findFromPartieConcernee(partieConcerneeId).size();
        CritereEfficacitePC__c critereEfficacitePCId = [select Id from CritereEfficacitePC__c limit 1];
        CritereEfficacitePCController.remove(critereEfficacitePCId);
        Test.stopTest();
        System.assertEquals(CritereEfficacitePCController.findFromPartieConcernee(partieConcerneeId).size(),(size-1),'ok');       
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
        Id critereEfficacitePCId=[select Id from CritereEfficacitePC__c limit 1].Id;
        CritereEfficacitePC__c critereEfficacitePC=CritereEfficacitePCController.getElementById(critereEfficacitePCId);
        Test.stopTest();
        System.assertNotEquals(critereEfficacitePC,null,'ok');      
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
        System.assertNotEquals(CritereEfficacitePCController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
    
}