/**
 * @author: David
 * @date: Creation: 25/05/2018
 * @description: class de teste de CategorieImpactController
 */
@isTest
public class CategorieImpactController_Test {
     @testSetup
    static void setup()
    {
		Orm_TestFactory.generateCategorieImpact();
    }
    /**
     * @author: David
     * @date: 25/05/2018
     * @descrition: recuperer la liste des categories Impact
     */
    @isTest
    static void findAll_TEST(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Test.startTest();
        List<Risque__c> risques=RisqueController.findAll();
        List<CategorieImpact__c> CategorieImpacts=CategorieImpactController.findAll();
        Test.stopTest();
        System.assertNotEquals(CategorieImpacts.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: 25/05/2018
     * @descrition:  
     */
    @isTest
    static void add_TEST(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
        CategorieImpact__c categorieImpact=new CategorieImpact__c(Name='risque de test',Description__c='description');
        categorieImpact=CategorieImpactController.add(CategorieImpact);
        Test.stopTest();
        System.assertNotEquals(categorieImpact.Id,null,'ok');
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition:  
     */
    @isTest
    static void remove_TEST(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
        Integer size=CategorieImpactController.findAll().size();
        CategorieImpact__c CategorieImpact=[select Id from CategorieImpact__c limit 1];
        CategorieImpactController.remove(CategorieImpact);
        Test.stopTest();
        System.assertEquals(CategorieImpactController.findAll().size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition: 
     */
    @isTest
    static void getElementById_TEST(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Test.startTest();
        Id CategorieImpactId=[select Id from CategorieImpact__c limit 1].Id;
        CategorieImpact__c CategorieImpact=CategorieImpactController.getElementById(CategorieImpactId);
        Test.stopTest();
        System.assertNotEquals(CategorieImpact,null,'ok');
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: 28/05/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(CategorieImpactController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
    
}