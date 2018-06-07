/**
 * @author: David
 * @date: Creation: 07/06/2018
 * @description: class de test d'ImpactRisqueController
 */
@isTest
public class ImpactRisqueEntiteController_Test {
	@testSetup
    static void setUp(){   
    	 List<Account> structures = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);    	
    	List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
    	List<Risque_Entite__c> risqueEntite = Orm_TestFactory.generateRisqueDetecte(risques[0].Id, responsables[0].Id,  structures[0].Id);
        List<CategorieImpact__c> categorieImpacts =Orm_TestFactory.generateCategorieImpact();      
   		List<Impact__c> impactRisque = Orm_TestFactory.generateImpact(categorieImpacts[0].id,risques[0].id);
   				Orm_TestFactory.generateImpactRisqueEntite(risqueEntite[0].id,impactRisque[0].id);
    }
    
    /**
     * @author: David
     * @date: Creation: 07/06/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName); 
         Test.startTest(); 
		        string  risqueEntiteId=[select Id from Risque_Entite__c limit 1].Id;
		        List<Impact_Risque_Entite__c> impactRisqueEntites=ImpactRisqueEntiteController.findAll(risqueEntiteId);
          Test.stopTest();
          System.assertNotEquals(impactRisqueEntites.size(),0,'ok');        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 07/06/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
      	string  risqueEntiteId=[select Id from Risque_Entite__c limit 1].Id;
      	string impactRisqueId= [select Id from Impact__c limit 1].id;
      Impact_Risque_Entite__c impactRisqueEntite= new Impact_Risque_Entite__c(risque_Entite__c = risqueEntiteId,ImpactRisque__c=impactRisqueId);
		         ImpactRisqueEntiteController.add(impactRisqueEntite);
        Test.stopTest();
        System.assertNotEquals(impactRisqueEntite.Id,null,'ok');        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 07/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);  
        Test.startTest();
        string  risqueEntiteId=[select Id from Risque_Entite__c limit 1].Id;
        Integer size=ImpactRisqueEntiteController.findAll(risqueEntiteId).size();
        Impact_Risque_Entite__c impactRisqueEntiteId = [select Id from Impact_Risque_Entite__c limit 1];
        ImpactRisqueEntiteController.remove(impactRisqueEntiteId);
        Test.stopTest();
        System.assertEquals(ImpactRisqueEntiteController.findAll(risqueEntiteId).size(),(size-1),'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 07/06/2018
     * @description: methode de test de getImpacts
     */
    @isTest
    static void getImpacts_Test(){
        String methodName='getImpacts';
        System.debug('### start- '+methodName);  
         Test.startTest(); 
        id risqueId=[select id from Risque__c limit 1].id;
        List<Impact__c> impacts=ImpactRisqueEntiteController.getImpacts(risqueId);
        Test.stopTest();
        System.assertNotEquals(impacts.size(),0,'ok');      
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: 07/06/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST()
    {
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(ImpactRisqueEntiteController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}