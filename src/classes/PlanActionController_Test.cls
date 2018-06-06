/**
 * @author: Laye
 * @date: Creation: 29/05/2018
 * @description: class de test de PlanActionController
 */
@isTest
public class PlanActionController_Test {
	@testSetup
    static void setUp(){
		List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
		List<Contact> riskManagers = Orm_TestFactory.generateRiskManager(entites[0].Id);
		List<Risque_Entite__c> risqueDetectes = Orm_TestFactory.generateRisqueDetecte(risques[0].Id, riskManagers[0].Id, entites[0].Id);
		Orm_TestFactory.generatePlanActions(risqueDetectes, riskManagers[0].Id);        
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findAllByRisqueEntite
     */
    @isTest
    static void findAllByRisqueEntite_Test(){
        String methodName='findAllByRisqueEntite';
        System.debug('### start- '+methodName);
		Id risqueEntiteId = [SELECT Id FROM Risque_Entite__c LIMIT 1].Id;
        List<Plan_Action__c> actionsPlan = PlanActionController.findAllByRisqueEntite(risqueEntiteId);
        System.assertEquals(actionsPlan.size(), 20);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        List<Plan_Action__c> actionsPlan = PlanActionController.findAll();
        System.assertEquals(actionsPlan.size(), 400);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Risque_Entite__c risqueEntite = [SELECT Id, entite__c FROM Risque_Entite__c LIMIT 1];
        Id entiteId = risqueEntite.Entite__c;
        Id riskManagerId = [SELECT Id FROM Contact WHERE AccountId=:entiteId limit 1].Id;
		Plan_Action__c planAction = new Plan_Action__c(Name='plan action', date_commencement__c = System.now(),
                                                       echeancier__c = System.now(), risque_Entite__c = risqueEntite.Id, 
                                                       gestionnaire__c = riskManagerId, RecordTypeId=PlanActionController.getPlanActionCorrectifRecordTypeId());
        PlanActionController.add(planAction);
        System.assertNotEquals(planAction.Id, null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        integer size = PlanActionController.findAll().size();
		Plan_Action__c planAction = [SELECT Id FROM Plan_Action__c limit 1]; 
        PlanActionController.remove(planAction);
        System.assertEquals(PlanActionController.findAll().size(), size-1);
        System.debug('### end- '+methodName);
    }
	
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findUserEntites
     */
    @isTest
    static void findUserEntites_Test(){
        String methodName='findUserEntites';
        System.debug('### start- '+methodName);
		Id entiteId = [SELECT Id FROM Account limit 1].Id;
        List<Contact> userEntites = PlanActionController.findUserEntites(entiteId);
        System.assertEquals(userEntites.size(), 20);
        System.debug('### end- '+methodName);
    }
    
     /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
		Id planActionId = [SELECT Id From Plan_Action__c limit 1].Id;
        Plan_Action__c planAction = PlanActionController.getElementById(planActionId);
        System.assertNotEquals(planAction.Id, null);
        System.debug('### end- '+methodName);
    }
    
     /**
     * @author: Laye
     * @date: Creation: 04/06/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Map<String,String> fields = PlanActionController.getObjectFields();
        System.assertNotEquals(fields.size(), null);
        System.debug('### end- '+methodName);
    }
}