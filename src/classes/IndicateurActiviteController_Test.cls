/**
 * @author: Laye
 * @date: Creation: 29/05/2018
 * @description: class de test d'ImpactRisqueController
 */
@isTest
public class IndicateurActiviteController_Test {
	@testSetup
    static void setUp(){
        List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
		List<Contact> riskManagers = Orm_TestFactory.generateRiskManager(entites[0].Id);
		List<Risque_Entite__c> risqueDetectes = Orm_TestFactory.generateRisqueDetecte(risques[0].Id, riskManagers[0].Id, entites[0].Id);
		List<Plan_Action__c> actionsPlan = Orm_TestFactory.generatePlanActions(risqueDetectes, riskManagers[0].Id);
		List<Activite__c> activites = Orm_TestFactory.generateActivites(actionsPlan[0]);
        Orm_TestFactory.genererIndicateurActivites(activites[0]);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @date: Modification: 05/06/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Indicateur_Activite__c indicateurActivite = [SELECT Id, activite__c FROM Indicateur_Activite__c limit 1];
		System.assertEquals(IndicateurActiviteController.findAll(indicateurActivite.activite__c).size(), 20);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @date: Modification: 05/06/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Id activiteId = [SELECT ID FROM Activite__c limit 1].Id;
		Indicateur_Activite__c indicateurActivite = new Indicateur_Activite__c(Name= 'Name', description__c= 'description', activite__c= activiteId);
        IndicateurActiviteController.add(indicateurActivite);
        System.assertNotEquals(indicateurActivite.Id, null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @date: Modification: 05/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
		Indicateur_Activite__c indicateurActivite = [SELECT Id, activite__c FROM Indicateur_Activite__c limit 1];
        integer size = IndicateurActiviteController.findAll(indicateurActivite.activite__c).size();
        IndicateurActiviteController.remove(indicateurActivite);
        System.assertEquals(IndicateurActiviteController.findAll(indicateurActivite.activite__c).size(), size - 1);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 05/06/2018
     * @description: methode de test getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Id indicateurActiviteId = [SELECT Id FROM Indicateur_Activite__c limit 1].Id;
        Indicateur_Activite__c indicateurActivite = IndicateurActiviteController.getElementById(indicateurActiviteId);
        System.assertNotEquals(indicateurActivite.Id, null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 05/06/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Map<String,String> fields = IndicateurActiviteController.getObjectFields();
        System.assertNotEquals(fields.size(), null);
        System.debug('### end- '+methodName);
    }
}