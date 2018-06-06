/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de test de PlanActionPreventifController_Test
 */
@isTest
public  class PlanActionPreventifController_Test {
	
	@testSetup
    static void setUp(){ 
    	List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
		List<Contact> riskManagers = Orm_TestFactory.generateRiskManager(entites[0].Id);
		List<Risque_Entite__c> risqueDetectes = Orm_TestFactory.generateRisqueDetecte(risques[0].Id, riskManagers[0].Id, entites[0].Id);
		List<ParamRisqueEntite__c> paramRisques = Orm_TestFactory.generateParamRisqueEntite( entites[0].Id, risques[0].Id);
		Orm_TestFactory.generatePlanActionActionPreventif(risqueDetectes, riskManagers[0].Id,paramRisques[0].id);  
		
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de findFromParamRisqueEntite
     */
    @isTest
    static void findAllByParamRisqueEntite_Test(){
        String methodName='findAllByParamRisqueEntite';
        System.debug('### start- '+methodName); 
             Test.startTest(); 
		        string  paramRisqueId=[select Id from ParamRisqueEntite__c limit 1].Id;
		        List<Plan_Action__c> planActionPreventif=PlanActionPreventifController.findAllByParamRisqueEntite(paramRisqueId);
          Test.stopTest();
          System.assertNotEquals(planActionPreventif.size(),0,'ok');  
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de findFromParamRisqueEntite
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName); 
             Test.startTest(); 
		       
		        List<Plan_Action__c> planActionPreventif=PlanActionPreventifController.findAll();
          Test.stopTest();
          System.assertNotEquals(planActionPreventif.size(),0,'ok');  
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
                Risque_Entite__c risqueEntite = [SELECT Id, entite__c FROM Risque_Entite__c LIMIT 1];
        Id entiteId = risqueEntite.Entite__c;
        Id riskManagerId = [SELECT Id FROM Contact WHERE AccountId=:entiteId limit 1].Id;
        string  paramRisqueId=[select Id from ParamRisqueEntite__c limit 1].Id;
		Plan_Action__c planAction = new Plan_Action__c(Name='plan action', date_commencement__c = System.now(),
                                                       echeancier__c = System.now(), risque_Entite__c = risqueEntite.Id, 
                                                       gestionnaire__c = riskManagerId,ParamRisqueEntite__c=paramRisqueId, RecordTypeId=PlanActionPreventifController.getPlanActionPreventifRecordTypeId());
          
           PlanActionPreventifController.add(planAction);
        Test.stopTest();
        System.assertNotEquals(planAction.Id,null,'ok'); 
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
        Integer size=PlanActionPreventifController.findAllByParamRisqueEntite(paramRisqueId).size();
        Plan_Action__c planAction=[select Id from Plan_Action__c limit 1];
        PlanActionPreventifController.remove(planAction);
        Test.stopTest();
        System.assertEquals(PlanActionPreventifController.findAllByParamRisqueEntite(paramRisqueId).size(),(size-1),'ok');
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
		Id planActionid = [SELECT Id  FROM Plan_Action__c LIMIT 1].Id;
        Plan_Action__c planAction = PlanActionPreventifController.getElementById(planActionid);
        System.assertNotEquals(planAction.Id, null);
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de findUserEntites
     */
    @isTest
    static void findUserEntites_Test(){
        String methodName='findUserEntites';
        System.debug('### start- '+methodName); 
             Test.startTest(); 
		        string  Accountid=[select Id from Account limit 1].Id;
		        List<Contact> planActionPreventif=PlanActionPreventifController.findUserEntites(Accountid);
          Test.stopTest();
          System.assertNotEquals(planActionPreventif.size(),0,'ok');  
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
        System.assertNotEquals(PlanActionPreventifController.getObjectFields().size(), null);
        System.debug('### end- '+methodName);
    }
	
	
    
}