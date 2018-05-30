/**
 * @author: Laye
 * @date: Creation: 30/05/2018
 * @description: class de teste de CategorieRisqueController
 */
@isTest
public  class CategorieRisqueController_Test {
	@testSetup
    static void setup(){
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
    }
    
    /**
     * @author: Laye
     * @date: 30/05/2018
     * @descrition: 
     */
    @isTest
    static void findAll_TEST(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Test.startTest();
        List<Categorie_Risque__c> categories = CategorieRisqueController.findAll();
        Test.stopTest();
        System.assertEquals(categories.size(),20,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: 30/05/2018
     * @descrition:  test de l'ajout
     */
    @isTest
    static void add_TEST(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();        
        Categorie_Risque__c categorie = new Categorie_Risque__c(Name='categorie',Description__c='description');
        CategorieRisqueController.add(categorie);
        Test.stopTest();
        System.assertNotEquals(categorie.Id,null,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: 30/05/2018
     * @descrition:  
     */
    @isTest
    static void remove_TEST(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
        Integer size = CategorieRisqueController.findAll().size();
        Categorie_Risque__c categorie = [select Id from Categorie_Risque__c limit 1];
        CategorieRisqueController.remove(categorie);
        Test.stopTest();
        System.assertEquals(CategorieRisqueController.findAll().size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: 30/05/2018
     * @descrition:  
     */
    @isTest
    static void getElementById_TEST(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Test.startTest();
        Id categorieId = [SELECT Id FROM Categorie_Risque__c limit 1].Id;
        Categorie_Risque__c categorie = CategorieRisqueController.getElementById(categorieId);
        Test.stopTest();
        System.assertNotEquals(categorie,null,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: 30/05/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(CategorieRisqueController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
    
}