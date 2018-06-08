/**
 * @author: Laye
 * @date: Creation: 28/05/2018
 * @description: class de teste de ChartRisqueController
 */
@isTest
public class ChartRisqueController_Test {
	@testSetup
    static void setUp(){
		List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
        List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
        List<Contact> riskManagers = Orm_TestFactory.generateRiskManager(entites[0].Id);
		Orm_TestFactory.generateRisqueDetecte(risques[0].Id, riskManagers[0].Id, entites[0].Id);
    }
     
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 07/06/2018
     * @description: methode de test de findEntites
     */
    @isTest
    static void findEntites_TEST(){
        String methodName='findEntites';
        System.debug('### start- '+methodName);
        List<Account> structures = ChartRisqueController.findEntites();
        System.assertEquals(structures.size(), 20);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 07/06/2018
     * @description: methode de test de findEntites
     */
    @isTest
    static void findRisques_TEST(){
        String methodName='findRisques';
        System.debug('### start- '+methodName);
        System.assertEquals(ChartRisqueController.findRisques().size(), 20);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 07/06/2018
     * @description: methode de test de findCategorieRisques
     */
    @isTest
    static void findCategorieRisques_TEST(){
        String methodName='findCategorieRisques';
        System.debug('### start- '+methodName);
        System.assertEquals(ChartRisqueController.findCategorieRisques().size(), 20);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 07/06/2018
     * @description: methode de test de risqueByCategorie
     */
    @isTest
    static void risqueByCategorie_TEST(){
        String methodName='risqueByCategorie';
        System.debug('### start- '+methodName);
        Id entiteId = [SELECT entite__c FROM Risque_Entite__c limit 1].entite__c;
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.risqueByCategorie(entiteId, annee).size() >= 2);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 07/06/2018
     * @description: methode de test de risqueByEntite
     */
    @isTest
    static void risqueByEntite_TEST(){
        String methodName='risqueByEntite';
        System.debug('### start- '+methodName);
        Id categorieId = [SELECT Id FROM Categorie_Risque__c limit 1].Id;
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.risqueByEntite(categorieId, annee).size() >= 2);
        System.debug('### end- '+methodName);
    }    
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 07/06/2018
     * @description: methode de test de risqueByEntiteAnnee
     */
    @isTest
    static void risqueByEntiteAnnee_TEST(){
        String methodName='risqueByEntiteAnnee';
        System.debug('### start- '+methodName);    
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.risqueByEntiteAnnee(annee).size() >= 2);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 07/06/2018
     * @description: methode de test de risqueByEntiteAnnee
     */
    @isTest
    static void risqueByUser_TEST(){
        String methodName='risqueByUser';
        System.debug('### start- '+methodName);
        Id entiteId = [SELECT entite__c FROM Risque_Entite__c limit 1].entite__c;
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.risqueByUser(entiteId, annee).size() >= 2);
        System.debug('### end- '+methodName);
    }
	
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de risqueAssocieProcessusByEntite
     */
    @isTest
    static void risqueAssocieProcessusByEntite_TEST(){
        String methodName='risqueAssocieProcessusByEntite';
        System.debug('### start- '+methodName);
        Id entiteId = [SELECT entite__c FROM Risque_Entite__c limit 1].entite__c;
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.risqueAssocieProcessusByEntite(entiteId, annee).size() >= 2);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de risqueEntiteByRisque
     */
    @isTest
    static void risqueEntiteByRisque_TEST(){
        String methodName='risqueEntiteByRisque';
        System.debug('### start- '+methodName);
        Id riskId = [SELECT Id FROM Risque__c limit 1].Id;
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.risqueEntiteByRisque(riskId, annee).size() >= 2);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 07/06/2018
     * @description: methode de test d'entiteAffecteeByRisque
     */
    @isTest
    static void entiteAffecteeByRisque_TEST(){
        String methodName='entiteAffecteeByRisque';
        System.debug('### start- '+methodName);
        Id riskId = [SELECT Id FROM Risque__c limit 1].Id;
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.entiteAffecteeByRisque(riskId, annee).size() >= 2);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de risqueEntiteByCotationByEntite
     */
    @isTest
    static void risqueEntiteByCotationByEntite_TEST(){
        String methodName='risqueEntiteByCotationByEntite';
        System.debug('### start- '+methodName);
        Id entiteId = [SELECT entite__c FROM Risque_Entite__c limit 1].entite__c;
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.risqueEntiteByCotationByEntite(entiteId, annee).size() >= 2);
        System.debug('### end- '+methodName);
    }
  
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de risqueEntiteByCotationByEntite
     */
     @isTest
    static void statistiqueRiskManager_TEST(){
        String methodName='statistiqueRiskManager';
        System.debug('### start- '+methodName);
        Id riskmanagerId = [SELECT id  FROM Contact limit 1].id;
        string annee = String.valueOf(System.today().year());
        System.assert(ChartRisqueController.statistiqueRiskManager(riskmanagerId, annee).size() >= 2);
        System.debug('### end- '+methodName);
    }
  
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de risqueEntiteByCotationByEntite
     */
     @isTest
    static void statistiqueRiskManager_TEST(){
        String methodName='risqueEntiteByCotationByEntite';
        System.debug('### start- '+methodName);
        
        System.debug('### end- '+methodName);
    }
}