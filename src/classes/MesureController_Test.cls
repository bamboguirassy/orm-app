/**
 * @author: Laye
 * @date: Creation: 29/05/2018
 * @description: class de test de MesureController
 */
@isTest
public class MesureController_Test {
	@testSetup
    static void setUp(){
		List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
		List<Contact> riskManagers = Orm_TestFactory.generateRiskManager(entites[0].Id);
		List<Risque_Entite__c> risqueDetectes = Orm_TestFactory.generateRisqueDetecte(risques[0].Id, riskManagers[0].Id, entites[0].Id);
		List<Plan_Action__c> actionsPlan = Orm_TestFactory.generatePlanActions(risqueDetectes, riskManagers[0].Id);
		List<Activite__c> activites = Orm_TestFactory.generateActivites(actionsPlan[0]);
        Orm_TestFactory.generateMesureActivites(activites[0]);     
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @date: Modification: 06/06/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
		Mesure__c mesure = [SELECT Id, activite__c FROM Mesure__c limit 1];
		System.assertEquals(MesureController.findAll(mesure.activite__c).size(), 20);         
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @date: Modification: 06/06/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Activite__c activite = [SELECT Id FROM Activite__c limit 1];
		Mesure__c newMesure = new Mesure__c(Name= 'Name', description__c= 'description', activite__c= activite.Id);
		newMesure = MesureController.add(newMesure);
		System.assertNotEquals(newMesure.Id, null);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @date: Modification: 06/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
		Mesure__c mesure = [SELECT Id, activite__c FROM Mesure__c limit 1];
        Id activiteId = mesure.activite__c;
        integer size = MesureController.findAll(activiteId).size();
        MesureController.remove(mesure);
        System.assertEquals(MesureController.findAll(activiteId).size(), size-1);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 06/06/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Id mesureId = [SELECT Id FROM Mesure__c limit 1].Id;
        Mesure__c mesure = MesureController.getElementById(mesureId);
        System.assertNotEquals(mesure.Id, null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 06/06/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Map<String,String> fields = MesureController.getObjectFields();
        System.assertNotEquals(fields.size(), null);
        System.debug('### end- '+methodName);
    }
}