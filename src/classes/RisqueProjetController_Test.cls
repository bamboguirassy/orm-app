/**
 * @author: David
 * @date: Creation: 04/06/2018
 * @description: class de test de risque projet
 */
@isTest
public class RisqueProjetController_Test {
	@testSetup
    static void setUp(){   
    	List<Account> structures = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);    	
    	List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
    	List <Risque_Entite__c> risqueDetecte = Orm_TestFactory.generateRisqueDetecte(risques[0].Id, responsables[0].Id,  structures[0].Id);
    	List <Projet__c> projets = Orm_TestFactory.generateProjet(structures[0].Id,responsables[0].Id);
    	Orm_TestFactory.generateRisqueProjet(projets[0].id,risqueDetecte[0].id);
    	     
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
        string idProjet=[select Id from Projet__c limit 1].id;
        List<Risque_projet__c> risqueProjets=RisqueProjetController.findAll(idProjet);
        Test.stopTest();
        System.assertNotEquals(risqueProjets.size(),0,'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 04/06/2018
     * @description: methode de test de getRisqueEntites
     */
    @isTest
    static void getRisqueEntites_Test(){
        String methodName='getRisqueEntites';
        System.debug('### start- '+methodName);
        Test.startTest();
        string idEntite = [select id from Account limit 1].Id;
        List<Risque_Entite__c> risqueEntites=RisqueProjetController.getRisqueEntites(idEntite);
        Test.stopTest();
        System.assertNotEquals(risqueEntites.size(),0,'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 04/06/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName); 
        Test.startTest();
        string idProjet=[select id from Projet__c limit 1].Id;
        string idRisqueDetecte=[select id from Risque_Entite__c limit 1].Id;
        Risque_projet__c risqueProjet=new Risque_projet__c(Projet__c=idProjet,Risque_detecte__c=idRisqueDetecte);
        RisqueProjetController.add(risqueProjet);
        Test.stopTest();
        System.assertNotEquals(risqueProjet.Id,null,'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 04/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
         string idProjet=[select Id from Projet__c limit 1].id;
        Integer size=RisqueProjetController.findAll(idProjet).size();
        Risque_projet__c risqueProjet=[select Id from Risque_projet__c limit 1];
        RisqueProjetController.remove(risqueProjet);
        Test.stopTest();
        System.assertEquals(RisqueProjetController.findAll(idProjet).size(),(size-1),'ok');        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 04/06/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(RisqueProjetController.getObjectFields().size(),0,'ok');
        Test.stopTest();        
        System.debug('### end- '+methodName);
    }
}