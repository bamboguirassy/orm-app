/**
 * @author: David
 * @date: Creation: 05/06/2018
 * @description: class de test de ElementSortieController
 */
@isTest
public class ElementSortieController_Test {
	@testSetup
    static void setUp(){  
    	List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);
    	List<Processus__c>  processus = Orm_TestFactory.generateProcessus(responsables[0].Id, responsables[0].Id,  structures[0].Id); 
    	Orm_TestFactory.generateElementSortie(processus[0].id);         
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
		        List<ElementSortie__c> elementSorties=ElementSortieController.findFromProcessus(processusId);
          Test.stopTest();
          System.assertNotEquals(elementSorties.size(),0,'ok');  
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
      
      ElementSortie__c elementSortie= new ElementSortie__c(processus__c=processusId);
		         ElementSortieController.add(elementSortie);
        Test.stopTest();
        System.assertNotEquals(elementSortie.Id,null,'ok');
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
        Integer size=ElementSortieController.findFromProcessus(processusId).size();
        ElementSortie__c elementSortieId = [select Id from ElementSortie__c limit 1];
        ElementSortieController.remove(elementSortieId);
        Test.stopTest();
        System.assertEquals(ElementSortieController.findFromProcessus(processusId).size(),(size-1),'ok'); 
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 01/06/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);  
          Test.startTest();
        Id elementSortieId=[select Id from ElementSortie__c limit 1].Id;
        ElementSortie__c elementSortie=ElementSortieController.getElementById(elementSortieId);
        Test.stopTest();
        System.assertNotEquals(elementSortie,null,'ok');      
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
        System.assertNotEquals(ElementSortieController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}