/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de test de MesurePreventionController
 */
@isTest
public class MesurePreventionController_Test {
	@testSetup
    static void setUp(){  
    	 List<Categorie_Risque__c> categories=Orm_TestFactory.generateCategorieRisque();
        List<Risque__c> risque= Orm_TestFactory.generateRisque(categories);
         List<Categorie_Mesure_Prevention__c> CategorieMesurePrevention=Orm_TestFactory.generateCategorieMesurePrevention();      
   		Orm_TestFactory.generateMesurePrevention(CategorieMesurePrevention[0].id,risque[0].id);
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
        List<Mesure_Prevention__c> mesurePreventions=MesurePreventionController.findAll(risqueId);
        Test.stopTest();
        System.assertNotEquals(mesurePreventions.size(),0,'ok');        
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
        Test.startTest();
		string risqueId=[select id from Risque__c limit 1].id;
		string categorieId=[select id from Categorie_Mesure_Prevention__c limit 1].id;
        List<Mesure_Prevention__c> MesurePrevention=MesurePreventionController.filterFromCategorie(categorieId,risqueId);
        Test.stopTest(); 
        System.assertNotEquals(MesurePrevention.size(),0,'ok');      
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
         Test.startTest();
        string risqueId=[select id from Risque__c limit 1].id;
		string categorieId=[select id from Categorie_Mesure_Prevention__c limit 1].id;
           Mesure_Prevention__c mesurePrevention=new Mesure_Prevention__c(CategorieMesurePrevention__c=categorieId,Description__c='name',Risque__c=risqueId);
           MesurePreventionController.add(mesurePrevention);
        Test.stopTest();
        System.assertNotEquals(mesurePrevention.Id,null,'ok');         
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
        Test.startTest();
         string risqueId = [select Id from Risque__c limit 1].Id;
        Integer size=MesurePreventionController.findAll(risqueId).size();
        Mesure_Prevention__c mesurePrevention=[select Id from Mesure_Prevention__c limit 1];
        MesurePreventionController.remove(mesurePrevention);
        Test.stopTest();
        System.assertEquals(MesurePreventionController.findAll(risqueId).size(),(size-1),'ok');         
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de getCategorieMesurePreventions
     */
    @isTest
    static void getCategorieMesurePreventions_Test(){
        String methodName='getCategorieMesurePreventions';
        System.debug('### start- '+methodName);  
        Test.startTest();
        List<Categorie_Mesure_Prevention__c> categorieMesurePreventions=MesurePreventionController.getCategorieMesurePreventions();
        Test.stopTest();
        System.assertNotEquals(categorieMesurePreventions.size(),0,'ok');       
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: Creation: 01/06/2018
     * @description: methode de test de getElementById
     */
    @isTest
    static void getElementById_Test(){
        String methodName='getElementById';
        System.debug('### start- '+methodName);  
          Test.startTest();
        Id mesurePreventionId=[select Id from Mesure_Prevention__c limit 1].Id;
        Mesure_Prevention__c mesurePrevention=MesurePreventionController.getElementById(mesurePreventionId);
        Test.stopTest();
        System.assertNotEquals(mesurePrevention,null,'ok');      
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: 06/06/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST()
    {
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(MesurePreventionController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
    
}