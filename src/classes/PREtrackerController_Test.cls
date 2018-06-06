/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de test de PREtrackerController
 */
@isTest
public class PREtrackerController_Test {
	@testSetup
    static void setUp(){ 
    	List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
		List<ParamRisqueEntite__c> paramRisques = Orm_TestFactory.generateParamRisqueEntite( entites[0].Id, risques[0].Id);  
		Orm_TestFactory.generatePREtracker( paramRisques[0].Id);        
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de findFromParamRisqueEntite
     */
    @isTest
    static void findFromParamRisqueEntite_Test(){
        String methodName='findFromParamRisqueEntite';
        System.debug('### start- '+methodName); 
        Test.startTest(); 
		        string  paramRisqueId=[select Id from ParamRisqueEntite__c limit 1].Id;
		        List<PREtracker__c> PREtrackers=PREtrackerController.findFromParamRisqueEntite(paramRisqueId);
          Test.stopTest();
          System.assertNotEquals(PREtrackers.size(),0,'ok');        
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
          string  paramRisqueId=[select Id from ParamRisqueEntite__c limit 1].Id;
        
           PREtracker__c PREtracker=new PREtracker__c(description__c='description',Name='name',valeur__c=1,ParamRisqueEntite__c=paramRisqueId);

           PREtrackerController.add(PREtracker);
        Test.stopTest();
        System.assertNotEquals(PREtracker.Id,null,'ok');          
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
          string  paramRisqueId=[select Id from ParamRisqueEntite__c limit 1].Id;
        Integer size=PREtrackerController.findFromParamRisqueEntite(paramRisqueId).size();
        PREtracker__c PREtracker=[select Id from PREtracker__c limit 1];
        PREtrackerController.remove(PREtracker);
        Test.stopTest();
        System.assertEquals(PREtrackerController.findFromParamRisqueEntite(paramRisqueId).size(),(size-1),'ok');
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
		Id PREtrackerId = [SELECT Id  FROM PREtracker__c LIMIT 1].Id;
        PREtracker__c PREtracker = PREtrackerController.getElementById(PREtrackerId);
        System.assertNotEquals(PREtracker.Id, null);
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        System.assertNotEquals(PREtrackerController.getObjectFields().size(), null);
        System.debug('### end- '+methodName);
    }
}