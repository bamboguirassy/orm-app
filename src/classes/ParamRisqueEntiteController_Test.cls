/**
 * @author: Laye
 * @date: Creation: 29/05/2018
 * @date: Modification: 01/05/2018
 * @description: class de test de ParamRisqueEntiteController
 */
@isTest
public class ParamRisqueEntiteController_Test {
	@testSetup
    static void setUp(){
		List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
		Orm_TestFactory.generateParamRisqueEntite( entites[0].Id, risques[0].Id);        
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findFromEntite
     */
    @isTest
    static void findFromEntite_Test(){
        String methodName='findFromEntite';
        System.debug('### start- '+methodName);
		Id entiteId = [SELECT Id FROM Account limit 1].Id;
        List<ParamRisqueEntite__c> paramRisqueEntites = ParamRisqueEntiteController.findFromEntite(entiteId);
        System.assertEquals(paramRisqueEntites.size(), 20);
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
		Account entite = [SELECT Id FROM Account limit 1];
		Risque__c risque = [SELECT Id FROM Risque__c limit 1];
        ParamRisqueEntite__c param = new ParamRisqueEntite__c(unite__c='unite', seuilApparution__c=1, risque__c=risque.Id, entite__c=entite.Id);
        ParamRisqueEntiteController.add(param);
        System.assertNotEquals(param.Id, null);
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
		ParamRisqueEntite__c param = [SELECT Id, entite__c FROM ParamRisqueEntite__c LIMIT 1];
        integer size = ParamRisqueEntiteController.findFromEntite(param.entite__c).size();
        ParamRisqueEntiteController.remove(param);
        System.assertEquals(ParamRisqueEntiteController.findFromEntite(param.entite__c).size(), size-1);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getRisques
     */
    @isTest
    static void getRisques_Test(){
        String methodName='getRisques';
        System.debug('### start- '+methodName);
		Account entite = [SELECT Id FROM Account limit 1];
        List<Risque__c> risques = ParamRisqueEntiteController.getRisques(entite.Id);
        System.assertEquals(risques.size(), 20);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 01/06/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
		Id paramId = [SELECT Id, entite__c FROM ParamRisqueEntite__c LIMIT 1].Id;
        ParamRisqueEntite__c param = ParamRisqueEntiteController.getElementById(paramId);
        System.assertNotEquals(param.Id, null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 01/06/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        System.assertNotEquals(ParamRisqueEntiteController.getObjectFields().size(), null);
        System.debug('### end- '+methodName);
    }
}