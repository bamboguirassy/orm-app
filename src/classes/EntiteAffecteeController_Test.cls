/**
 * @author: David
 * @date: Creation: 04/06/2018
 * @description: class de test d'EntiteAffecteeController
 */
@isTest
public class EntiteAffecteeController_Test {
	@testSetup
    static void setUp(){  
    	List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id); 
    	List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
    	List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
    	List <Risque_Entite__c> risqueEntites=Orm_TestFactory.generateRisqueDetecte(risques[0].Id, responsables[0].Id,  structures[0].Id); 
    	Orm_TestFactory.generateEntiteAffectee(risqueEntites[0].Id,structures[0].Id);     
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de getStructureRecordTypeId
     */
    @isTest
    static void getStructureRecordTypeId_Test(){
        String methodName='getStructureRecordTypeId';
        System.debug('### start- '+methodName);
       
        System.debug('### end- '+methodName);
    }
    
     /**
     * @author: David
     * @date: Creation: 04/06/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Test.startTest(); 
          string  risqueEntiteId=[select Id from Risque_Entite__c limit 1].Id;
          List<Entite_Affectee__c> EntiteAffectee=EntiteAffecteeController.findAll(risqueEntiteId);
        Test.stopTest();
        System.assertNotEquals(EntiteAffectee.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de findAllEntite
     */
    @isTest
    static void findAllEntite_Test(){
        String methodName='findAllEntite';
        System.debug('### start- '+methodName);
        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Test.startTest();
        string idEntite=[select id from Account limit 1].Id;
       string  risqueEntiteId=[select Id from Risque_Entite__c limit 1].Id;
      Entite_Affectee__c entiteAffectee= new Entite_Affectee__c(risque_Entite__c=risqueEntiteId,Entite__c=idEntite);
		         EntiteAffecteeController.add(entiteAffectee);
        Test.stopTest();
        System.assertNotEquals(entiteAffectee.Id,null,'ok');
        System.debug('### end- '+methodName);
    }
    
     /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
        string  risqueEntiteId=[select Id from Risque_Entite__c limit 1].Id;
        Integer size=EntiteAffecteeController.findAll(risqueEntiteId).size();
        Entite_Affectee__c entiteAffectee=[select Id from Entite_Affectee__c limit 1];
        EntiteAffecteeController.remove(entiteAffectee);
        Test.stopTest();
        System.assertEquals(EntiteAffecteeController.findAll(risqueEntiteId).size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de getEntites
     */
    @isTest
    static void getEntites_Test(){
        String methodName='getEntites';
        System.debug('### start- '+methodName);
      System.assertNotEquals(EntiteAffecteeController.getEntites().size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 04/06/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST()
    {
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(EntiteAffecteeController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    } 
}