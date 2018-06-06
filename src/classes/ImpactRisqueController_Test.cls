/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de test d'ImpactRisqueController
 */
@isTest
public class ImpactRisqueController_Test {
	@testSetup
    static void setUp(){ 
    	List<Categorie_Risque__c> categories=Orm_TestFactory.generateCategorieRisque();
        List<Risque__c> risque= Orm_TestFactory.generateRisque(categories);
        List<CategorieImpact__c> categorieImpacts =Orm_TestFactory.generateCategorieImpact();      
   		Orm_TestFactory.generateImpact(categorieImpacts[0].id,risque[0].id);       
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName); 
        Test.startTest();
        string risqueId = [select Id from Risque__c limit 1].Id;
        List<Impact__c> Impact=ImpactRisqueController.findAll(risqueId);
        Test.stopTest();
        System.assertNotEquals(Impact.size(),0,'ok');        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de filterFromCategorie
     */
    @isTest
    static void filterFromCategorie_Test(){
        String methodName='filterFromCategorie';
        System.debug('### start- '+methodName);        
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
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de getCategorieImpacts
     */
    @isTest
    static void getCategorieImpacts_Test(){
        String methodName='getCategorieImpacts';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
}