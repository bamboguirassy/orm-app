/**
 * @author: david
 * @date: Creation: 31/05/2018
 * @description: class de test de RiskManagerController
 */
@isTest
public class RisqueEntiteController_Test {
	@testSetup
    static void setUp(){
        List<Account> structures = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);    	
    	List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
        Orm_TestFactory.generateParamRisqueEntite(structures[0].Id, risques[0].Id);
    	Orm_TestFactory.generateRisqueDetecte(risques[0].Id, responsables[0].Id,  structures[0].Id);
    }
    
    /**
     * @author:david
     * @date: Creation: 29/05/2018
     * @description: methode de test de findAllByEntite
     */
    @isTest
    static void findAllByEntite_Test(){
        String methodName='findAllByEntite';
        System.debug('### start- '+methodName);   
        Test.startTest(); 
        id entiteId=[select id from Account limit 1].id;
        List<Risque_Entite__c> risqueEntite=RisqueEntiteController.findAllByEntite(entiteId);
        Test.stopTest();
        System.assertNotEquals(risqueEntite.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author:david
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
     * @author:david
     * @date: Creation: 29/05/2018
     * @description: methode de test de filterFromCategorieEntite
     */
    @isTest
    static void filterFromCategorieEntite_Test(){
        String methodName='filterFromCategorieEntite';
        System.debug('### start- '+methodName);   
        Test.startTest(); 
        id entiteId=[select id from Account limit 1].id;
        id categorieId=[select id from Categorie_Risque__c limit 1].id;
        List<Risque_Entite__c> risqueEntite=RisqueEntiteController.filterFromCategorieEntite(categorieId,entiteId);
        Test.stopTest();
        System.assertNotEquals(risqueEntite.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
        
     /**
     * @author:david
     * @date: Creation: 29/05/2018
     * @description: methode de test de filterFromCategorie
     */
    @isTest
    static void filterFromCategorie_Test(){
        String methodName='filterFromCategorie';
        System.debug('### start- '+methodName);   
        Test.startTest(); 
        id categorieId=[select id from Categorie_Risque__c limit 1].id;
        List<Risque_Entite__c> risqueEntite=RisqueEntiteController.filterFromCategorie(categorieId);
        Test.stopTest();
        System.assertNotEquals(risqueEntite.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: 25/05/2018
     * @descrition:  
     */
    @isTest
    static void add_TEST()
    {
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
        string idEntite=[select id from Account limit 1].Id;
        string idRisque=[select id from Risque__c limit 1].Id;
        string idResponsable=[select id from Contact limit 1].Id;
      Risque_Entite__c risqueEntite= new Risque_Entite__c(frequence__c=2,
		       gravite__c=1,maitrise__c=2,Date_Detection__c=System.today(),
		        risque__c=idRisque,responsable__c=idResponsable, 
		        description__c='description', entite__c= idEntite);
		         RisqueEntiteController.add(risqueEntite);
        Test.stopTest();
        System.assertNotEquals(risqueEntite.Id,null,'ok');
        System.debug('### end- '+methodName);
    }  
     /**
     * @author: David
     * @date: 01/06/2018
     * @descrition: 
     */
    @isTest
    static void getElementById_TEST()
    {
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Test.startTest();
        Id risqueEntiteId=[select Id from Risque_Entite__c limit 1].Id;
        Risque_Entite__c risqueEntite=RisqueEntiteController.getElementById(risqueEntiteId);
        Test.stopTest();
        System.assertNotEquals(risqueEntite,null,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: 01/06/2018
     * @descrition:  
     */
    @isTest
    static void remove_TEST()
    {
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
        Integer size=RisqueEntiteController.findAll().size();
        Risque_Entite__c risqueEntite=[select Id from Risque_Entite__c limit 1];
        RisqueEntiteController.remove(risqueEntite);
        Test.stopTest();
        System.assertEquals(RisqueEntiteController.findAll().size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
    
     /**
     * @author: David
     * @date: 01/06/2018
     * @descrition: 
     */
    @isTest
    static void findUserEntites_TEST()
    {
        String methodName='findUserEntites';
        System.debug('### start- '+methodName);
        Test.startTest();
       string entite=[select Id from Account limit 1].Id;
        List<Contact> responsable=RisqueEntiteController.findUserEntites(entite);
        Test.stopTest();
        System.assertNotEquals(responsable,null,'ok');
        System.debug('### end- '+methodName);
    }
    
     /**
     * @author:david
     * @date: Creation: 01/06/2018
     * @description: 
     */
    @isTest
    static void getCategorieRisques_Test(){
        String methodName='getCategorieRisques';
        System.debug('### start- '+methodName);   
        Test.startTest(); 
        List<Categorie_Risque__c> categorieRisque=RisqueEntiteController.getCategorieRisques();
        Test.stopTest();
        System.assertNotEquals(categorieRisque.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    
     /**
     * @author:david
     * @date: Creation: 01/06/2018
     * @description: 
     */
    @isTest
    static void findRisques_Test(){
        String methodName='findRisques';
        System.debug('### start- '+methodName);   
        Test.startTest(); 
        List<Risque__c> Risque=RisqueEntiteController.findRisques();
        Test.stopTest();
        System.assertNotEquals(Risque.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: 01/06/2018
     * @descrition: 
     */
    @isTest
    static void getParamRisqueEntite_TEST()
    {
        String methodName='getParamRisqueEntite';
        System.debug('### start- '+methodName);
        Test.startTest();
        string paramId=[select Id from ParamRisqueEntite__c limit 1].Id;
        ParamRisqueEntite__c param=RisqueEntiteController.getParamRisqueEntite(paramId);
        Test.stopTest();
        System.assertNotEquals(param,null,'ok');
        System.debug('### end- '+methodName);
    }
    
     
  	 /**
     * @author:david
     * @date: Creation: 01/06/2018
     * @description: 
     */
    @isTest
    static void findAllByManagerRisk_Test(){
        String methodName='findAllByManagerRisk';
        System.debug('### start- '+methodName);   
        Test.startTest(); 
        string idRiskManager=[select id from Contact limit 1].Id;
        List<Risque_Entite__c> RisqueEntite=RisqueEntiteController.findAllByManagerRisk(idRiskManager);
        Test.stopTest();
        System.assertNotEquals(RisqueEntite.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
     /**
     * @author: David
     * @date: 01/06/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST()
    {
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(RisqueEntiteController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    } 
}