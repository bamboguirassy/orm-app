/**
 * @author: Laye
 * @date: Creation: 28/05/2018
 * @description: class de teste de ActiviteController
 */
@isTest
public class ActiviteController_Test {
	
    @testSetup
    static void setUp(){
		List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
		List<Contact> riskManagers = Orm_TestFactory.generateRiskManager(entites[0].Id);
		List<Risque_Entite__c> risqueDetectes = Orm_TestFactory.generateRisqueDetecte(risques[0].Id, riskManagers[0].Id, entites[0].Id);
		List<Plan_Action__c> actionsPlan = Orm_TestFactory.generatePlanActions(risqueDetectes, riskManagers[0].Id);
		Orm_TestFactory.generateActivites(actionsPlan[0]);       
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 05/06/2018
     * @description: methode de test getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Id activityId = [SELECT Id FROM Activite__c limit 1].Id;
        Activite__c activite = ActiviteController.getElementById(activityId);
        System.assertNotEquals(activite.Id, null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 05/06/2018
     * @description: methode de test findAllByPlanAction
     */
    @isTest
    static void findAllByPlanAction_Test(){
        String methodName='findAllByPlanAction';
        System.debug('### start- '+methodName);
        Activite__c activity = [SELECT Id, plan_Action__c FROM Activite__c limit 1];
        Id actionPlanId = activity.plan_Action__c;
        List<Activite__c> activites = ActiviteController.findAllByPlanAction(actionPlanId);
        System.debug('activites.size- ' + activites.size());
        System.assertEquals(activites.size(), 20);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        
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
        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de findUserEntites
     */
    @isTest
    static void findUserEntites_Test(){
        String methodName='findUserEntites';
        System.debug('### start- '+methodName);
        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        
        System.debug('### end- '+methodName);
    }
    
}