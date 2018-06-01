/**
 * @author: david
 * @date: Creation: 31/05/2018
 * @description: class de test de RiskManagerController
 */
@isTest
public class RisqueEntiteController_Test {
	@testSetup
    static void setUp(){
    	  Orm_TestFactory.generateStructure(); 
    	  Orm_TestFactory.generateCauseRisqueDetecte(); 
    }
    
    /**
     * @author: david
     * @date: Creation: 31/05/2018
     * @description: methode de test de findAllByEntite
     */
    @isTest
    static void findAllByEntite_Test(){
        String methodName='findAllByEntite';
        System.debug('### start- '+methodName);     
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
        Test.startTest(); 
        List<Risque_Entite__c> risqueEntite=RisqueEntiteController.findAll();
        Test.stopTest();
        System.assertNotEquals(risqueEntite.size(),0,'ok');  
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de filterFromCategorieEntite
     */
    @isTest
    static void filterFromCategorieEntite_Test(){
        String methodName='filterFromCategorieEntite';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de filterFromCategorie
     */
    @isTest
    static void filterFromCategorie_Test(){
        String methodName='filterFromCategorie';
        System.debug('### start- '+methodName);        
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
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getCategorieRisques
     */
    @isTest
    static void getCategorieRisques_Test(){
        String methodName='getCategorieRisques';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findRisques
     */
    @isTest
    static void findRisques_Test(){
        String methodName='findRisques';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getParamRisqueEntite
     */
    @isTest
    static void getParamRisqueEntite_Test(){
        String methodName='getParamRisqueEntite';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
}