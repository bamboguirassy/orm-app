/**
 * @author: David
 * @date: Creation: 05/06/2018
 * @description: class de test de ProcessusSortieController
 */
@isTest
public class ProcessusSortieController_Test {
	@testSetup
    static void setUp(){ 
    	List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c>  processus = Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	Orm_TestFactory.generateProcessusSortie(processus[0].id,processus[0].id);        
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
		        List<ProcessusSortie__c> processusSorties=ProcessusSortieController.findFromProcessus(processusId);
          Test.stopTest();
          System.assertNotEquals(processusSorties.size(),0,'ok');         
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
      	ProcessusSortie__c processusSortie= new ProcessusSortie__c(processus__c=processusId,destination__c=processusId);
		         ProcessusSortieController.add(processusSortie);
        Test.stopTest();
        System.assertNotEquals(processusSortie.Id,null,'ok');     
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
        Integer size=ProcessusSortieController.findFromProcessus(processusId).size();
        ProcessusSortie__c processusSortieId = [select Id from ProcessusSortie__c limit 1];
        ProcessusSortieController.remove(processusSortieId);
        Test.stopTest();
        System.assertEquals(ProcessusSortieController.findFromProcessus(processusId).size(),(size-1),'ok');     
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
		        string  entiteId=[select Id from Account limit 1].Id;
		        List<Processus__c> processus=ProcessusSortieController.getProcessus(entiteId);
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
        System.assertNotEquals(ProcessusSortieController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}