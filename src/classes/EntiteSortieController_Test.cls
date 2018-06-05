/**
 * @author: David
 * @date: Creation: 05/06/2018
 * @description: class de teste des entite
 */
@isTest
public class EntiteSortieController_Test {
	@testSetup
    static void setUp(){ 
        List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c>  processus = Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	Orm_TestFactory.generateEntiteSortie(processus[0].id,structures[0].id);       
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
		        List<EntiteSortie__c> entiteSorties=EntiteSortieController.findFromProcessus(processusId);
          Test.stopTest();
          System.assertNotEquals(entiteSorties.size(),0,'ok'); 
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
      	string  processusId=[select Id from Processus__c limit 1].Id;
      	string entiteId= [select Id from Account limit 1].id;
      EntiteSortie__c entiteSortie= new EntiteSortie__c(processus__c=processusId,entite__c=entiteId);
		         EntiteSortieController.add(entiteSortie);
        Test.stopTest();
        System.assertNotEquals(entiteSortie.Id,null,'ok');
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
        Integer size=EntiteSortieController.findFromProcessus(processusId).size();
        EntiteSortie__c EntiteSortieId = [select Id from EntiteSortie__c limit 1];
        EntiteSortieController.remove(EntiteSortieId);
        Test.stopTest();
        System.assertEquals(EntiteSortieController.findFromProcessus(processusId).size(),(size-1),'ok'); 
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de getEntites
     */
    @isTest
    static void getEntites_Test(){
        String methodName='getEntites';
        System.debug('### start- '+methodName);
        System.assertNotEquals(EntiteSortieController.getEntites().size(),0,'ok');
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
        System.assertNotEquals(EntiteSortieController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}