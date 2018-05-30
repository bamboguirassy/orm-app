/**
 * @author: Moussa Fofana
 * @date: Creation: 25/05/2018
 * @description: class de teste de RisqueController
 */
@isTest
public class RisqueController_Test {
    @testSetup
    static void setup(){
        List<Categorie_Risque__c> categories=Orm_TestFactory.generateCategorieRisque();
        Orm_TestFactory.generateRisque(categories);
    }
    /**
     * @author: Moussa
     * @date: 25/05/2018
     * @descrition: 
     */
    @isTest
    static void findAll_TEST(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Test.startTest();
        List<Risque__c> risques=RisqueController.findAll();
        Test.stopTest();
        System.assertNotEquals(risques.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Moussa
     * @date: 25/05/2018
     * @descrition:  
     */
    @isTest
    static void filterFromCategorie_TEST(){
        String methodName='filterFromCategorie';
        System.debug('### start- '+methodName);
        Test.startTest();
        String idCategorie=[select Id from Categorie_Risque__c Limit 1].Id;
        List<Risque__c> risques=RisqueController.filterFromCategorie(idCategorie);
        Test.stopTest();
        System.assertEquals(risques.size(),1,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Moussa
     * @date: 25/05/2018
     * @descrition:  
     */
    @isTest
    static void add_TEST(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
        String idCategorie=[select Id from Categorie_Risque__c Limit 1].Id;
        Risque__c risque=new Risque__c(Name='risque de test',description__c='description',categorieRisque__c=idCategorie);
        risque=RisqueController.add(risque);
        Test.stopTest();
        System.assertNotEquals(risque.Id,null,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Moussa
     * @date: 25/05/2018
     * @descrition:  
     */
    @isTest
    static void remove_TEST(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
        Integer size=RisqueController.findAll().size();
        Risque__c risque=[select Id from Risque__c limit 1];
        RisqueController.remove(risque);
        Test.stopTest();
        System.assertEquals(RisqueController.findAll().size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Moussa
     * @date: 25/05/2018
     * @descrition: 
     */
    @isTest
    static void getCategorieRisques_TEST(){
        String methodName='getCategorieRisques';
        System.debug('### start- '+methodName);
        Test.startTest();
        List<Categorie_Risque__c> categorieRisques=RisqueController.getCategorieRisques();
        Test.stopTest();
        System.assertNotEquals(categorieRisques.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Moussa
     * @date: 25/05/2018
     * @descrition: 
     */
    @isTest
    static void getElementById_TEST(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Test.startTest();
        Id risqueId=[select Id from Risque__c limit 1].Id;
        Risque__c risque=RisqueController.getElementById(risqueId);
        Test.stopTest();
        System.assertNotEquals(risque,null,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Moussa
     * @date: 25/05/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(RisqueController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
    
    
}