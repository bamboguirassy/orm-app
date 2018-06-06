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
        List<Impact__c> Impacts=ImpactRisqueController.findAll(risqueId);
        Test.stopTest();
        System.assertNotEquals(Impacts.size(),0,'ok');        
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
		string categorieId=[select id from CategorieImpact__c limit 1].id;
        List<Impact__c> impacts=ImpactRisqueController.filterFromCategorie(categorieId,risqueId);
        Test.stopTest();  
               System.assertNotEquals(impacts.size(),0,'ok');
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
		string categorieId=[select id from CategorieImpact__c limit 1].id;
           Impact__c impactRisque=new Impact__c(Categorie_Impact__c=categorieId,description__c='name',risque__c=risqueId);
           ImpactRisqueController.add(impactRisque);
        Test.stopTest();
        System.assertNotEquals(impactRisque.Id,null,'ok');      
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
        Integer size=ImpactRisqueController.findAll(risqueId).size();
        Impact__c impactRisque=[select Id from Impact__c limit 1];
        ImpactRisqueController.remove(impactRisque);
        Test.stopTest();
        System.assertEquals(ImpactRisqueController.findAll(risqueId).size(),(size-1),'ok');    
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
        Id impactId=[select Id from Impact__c limit 1].Id;
        Impact__c mesurePrevention=ImpactRisqueController.getElementById(impactId);
        Test.stopTest();
        System.assertNotEquals(mesurePrevention,null,'ok');      
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
        Test.startTest();
        System.assertNotEquals(ImpactRisqueController.getCategorieImpacts().size(),0,'ok');
        Test.stopTest();        
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
        System.assertNotEquals(ImpactRisqueController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}