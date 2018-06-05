/**
 * @author: David
 * @date: Creation: 05/06/2018
 * @description: class de test de ProcessusEntreeController
 */
@isTest
public class ProcessusEntreeController_Test {
	@testSetup
    static void setUp(){ 
    	 List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c>  processus = Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	Orm_TestFactory.generateProcessusEntree(processus[0].id,processus[0].id);      
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
        List<ProcessusEntree__c> processusEntrees=ProcessusEntreeController.findFromProcessus(processusId);
        Test.stopTest();
        System.assertNotEquals(processusEntrees.size(),0,'ok');        
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
      ProcessusEntree__c processusEntree= new ProcessusEntree__c(processus__c=processusId,source__c=processusId);
		         ProcessusEntreeController.add(processusEntree);
        Test.stopTest();
        System.assertNotEquals(processusEntree.Id,null,'ok');       
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
        Integer size=ProcessusEntreeController.findFromProcessus(processusId).size();
        ProcessusEntree__c processusEntreeId = [select Id from ProcessusEntree__c limit 1];
        ProcessusEntreeController.remove(processusEntreeId);
        Test.stopTest();
        System.assertEquals(ProcessusEntreeController.findFromProcessus(processusId).size(),(size-1),'ok');     
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 05/06/2018
     * @description: methode de test de getProcessus
     */
    @isTest
    static void getProcessus_Test(){
        String methodName='getProcessus';
        System.debug('### start- '+methodName);  
         Test.startTest();
        Id entiteId=[select Id from Account limit 1].Id;
        List<Processus__c> processus=ProcessusEntreeController.getProcessus(entiteId);
        Test.stopTest();
        System.assertNotEquals(processus,null,'ok');      
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
        System.assertNotEquals(ProcessusEntreeController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}