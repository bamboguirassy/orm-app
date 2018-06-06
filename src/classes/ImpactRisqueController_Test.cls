/**
 * @author: Dibocor
 * @date: Creation: 31/05/2018
 * @description: class de test d'ImpactRisqueController
 */
@isTest
public class ImpactRisqueController_Test {
	@testSetup
    static void setUp(){     
    	List<CategorieImpact__c> categorieImpacts = Orm_TestFactory.generateCategorieImpact();  
    	Orm_TestFactory.generateImpactRisque(categorieImpacts);
    }
    
    /**
     * @author: Dibocor 
     * @date: Creation: 31/05/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        
        Risque__c risque = [select Id from Risque__c Limit 1];
        
        Test.startTest();
        List<Impact__c> impactRisques = ImpactRisqueController.findAll(risque.Id);
        Test.stopTest();
        System.assertNotEquals(impactRisques.size(),0,'ok findAll');
              
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Dibocor
     * @date: Creation: 31/05/2018
     * @description: methode de test de filterFromCategorie
     */
    @isTest
    static void filterFromCategorie_Test(){
        String methodName='filterFromCategorie';
        System.debug('### start- '+methodName);   
        
        Risque__c risque = [select Id from Risque__c Limit 1];
        Categorie_Risque__c categorie = [select Id from Categorie_Risque__c Limit 1];
        
        Test.startTest();
        List<Impact__c> listFilterImpact = ImpactRisqueController.filterFromCategorie(categorie.Id, risque.Id);
        Test.stopTest();
        System.assert(listFilterImpact.size() > 0);
             
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Dibocor
     * @date: Creation: 31/05/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Dibocor
     * @date: Creation: 31/05/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Dibocor
     * @date: Creation: 31/05/2018
     * @description: methode de test de getCategorieImpacts
     */
    @isTest
    static void getCategorieImpacts_Test(){
        String methodName='getCategorieImpacts';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
}