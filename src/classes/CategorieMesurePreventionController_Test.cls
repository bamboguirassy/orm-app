/**
 * @author: David
 * @date: Creation: 28/05/2018
 * @description: class de teste de CategorieMesurePreventionController
 */
@isTest
public class CategorieMesurePreventionController_Test {
@testSetup
    static void setup()
    {
		Orm_TestFactory.generateCategorieMesurePrevention();
    }
	 /**
     * @author: David
     * @date: 25/05/2018
     * @descrition: recuperer la liste des categories Mesures Prevention
     */
    @isTest
    static void findAll_TEST(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Test.startTest();
        List<Categorie_Mesure_Prevention__c> CategorieMesurePreventions=CategorieMesurePreventionController.findAll();
        Test.stopTest();
        System.assertNotEquals(CategorieMesurePreventions.size(),0,'ok');
        System.debug('### end- '+methodName);
    }    
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition:   ajouter CATEGORIE MESURE PREVENTION
     */
    @isTest
    static void add_TEST(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
        Categorie_Mesure_Prevention__c CategorieMesurePrevention=new Categorie_Mesure_Prevention__c(Name='CategorieMesurePrevention',Description__c='description');
        CategorieMesurePrevention=CategorieMesurePreventionController.add(CategorieMesurePrevention);
        Test.stopTest();
        System.assertNotEquals(CategorieMesurePrevention.Id,null,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition:  suppression categorie mesure prevention  
     */
    @isTest
    static void remove_TEST(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
        Integer size=CategorieMesurePreventionController.findAll().size();
        Categorie_Mesure_Prevention__c CategorieMesurePrevention=[select Id from Categorie_Mesure_Prevention__c limit 1];
        CategorieMesurePreventionController.remove(CategorieMesurePrevention);
        Test.stopTest();
        System.assertEquals(CategorieMesurePreventionController.findAll().size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: 28/05/2018
     * @descrition: recuperation d'une categorie mesure prevention
     */
    @isTest
    static void getElementById_TEST(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Test.startTest();
        Id CategorieMesurePreventionId=[select Id from Categorie_Mesure_Prevention__c limit 1].Id;
        Categorie_Mesure_Prevention__c CategorieMesurePrevention=CategorieMesurePreventionController.getElementById(CategorieMesurePreventionId);
        Test.stopTest();
        System.assertNotEquals(CategorieMesurePrevention,null,'ok');
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
        System.assertNotEquals(CategorieMesurePreventionController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
    
}