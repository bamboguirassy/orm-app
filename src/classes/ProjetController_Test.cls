/**
 * @author: David
 * @date: Creation: 01/06/2018
 * @description: class de test de ProjetController
 */
@isTest
public class ProjetController_Test {
	@testSetup
    static void setUp(){
    	 List<Account> structures = Orm_TestFactory.generateStructure();
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);   
    	Orm_TestFactory.generateProjet(structures[0].Id,responsables[0].Id);
    	List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
    	List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
    	Orm_TestFactory.generateRisqueDetecte(risques[0].Id, responsables[0].Id,  structures[0].Id);
    }
    
    /**
     * @author: David
     * @date: Creation: 04/06/2018
     * @description: methode de test de getStructureRecordTypeId
     */
    @isTest
    static void getStructureRecordTypeId_Test(){
        String methodName='getStructureRecordTypeId';
        System.debug('### start- '+methodName);
        Test.startTest();
        ProjetController.getStructureRecordTypeId();
        Test.stopTest();        
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
        Id projetId=[select Id from Projet__c limit 1].Id;
        Projet__c projet=ProjetController.getElementById(projetId);
        Test.stopTest();
        System.assertNotEquals(projet,null,'ok');      
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 01/06/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName); 
         Test.startTest();
        List<Projet__c> projets=ProjetController.findAll();
        Test.stopTest();
        System.assertNotEquals(projets.size(),0,'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 01/06/2018
     * @description: methode de test de findAllByStructure
     */
    @isTest
    static void findAllByStructure_Test(){
        String methodName='findAllByStructure';
        System.debug('### start- '+methodName);
		Test.startTest();
		string entiteId=[select id from Account limit 1].id;
        List<Projet__c> projets=ProjetController.findAllByStructure(entiteId);
        Test.stopTest();
        System.assertNotEquals(projets.size(),0,'ok');
		       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 01/06/2018
     * @description: methode de test de findAllByRiskManager
     */
    @isTest
    static void findAllByRiskManager_Test(){
        String methodName='findAllByRiskManager';
        System.debug('### start- '+methodName);   
        Test.startTest();
		string responsable=[select id from Contact limit 1].id;
        List<Projet__c> projets=ProjetController.findAllByRiskManager(responsable);
        Test.stopTest();
        System.assertNotEquals(projets.size(),0,'ok');
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
        string idEntite=[select id from Account limit 1].Id;
        string idResponsable=[select id from Contact limit 1].Id;
        
           Projet__c projet=new Projet__c(Cout__c = 25,Description__c = 'description',Name = 'nom' , Site_Web_du_projet__c = 'site@site.com',
                                      Date_fin_prevue__c=System.today() , Date_debut__c = System.today() , Structure__c = idEntite , Responsable__c = idResponsable);

        Projet__c projet2 = null;

        if(projet!=null)
        	{
       	  projet=ProjetController.add(projet);
            }

            
           ProjetController.add(projet);
           ProjetController.add(projet2);
        Test.stopTest();
        System.assertNotEquals(projet.Id,null,'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: DAVID
     * @date: Creation: 01/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);  
         Test.startTest();
        Integer size=ProjetController.findAll().size();
        Projet__c projet=[select Id from Projet__c limit 1];
        ProjetController.remove(projet);
        Test.stopTest();
        System.assertEquals(ProjetController.findAll().size(),(size-1),'ok');      
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 04/06/2018
     * @description: methode de test de getEntites
     */
    @isTest
    static void getEntites_Test(){
        String methodName='getEntites';
        System.debug('### start- '+methodName);   
        Test.startTest();
        List<Account> Entite=ProjetController.getEntites();
        Test.stopTest();   
        System.assertNotEquals(Entite.size(),0,'ok');  
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 04/06/2018
     * @description: methode de test de findRisqueDetectes
     */
    @isTest
    static void findRisqueDetectes_Test(){
        String methodName='findRisqueDetectes';
        System.debug('### start- '+methodName);  
        Test.startTest();
        string entiteId=[select id from Account limit 1].id;
         List<Risque_Entite__c> risqueEntite=ProjetController.findRisqueDetectes(entiteId);
        Test.stopTest();   
        System.assertNotEquals(risqueEntite.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: Creation: 01/06/2018
     * @description: methode de test de findUserEntites
     */
    @isTest
    static void findUserEntites_Test(){
        String methodName='findUserEntites';
        System.debug('### start- '+methodName);
        Test.startTest();
		string entiteId=[select id from Account limit 1].id;
        List<Contact> responsable=ProjetController.findUserEntites(entiteId);
        Test.stopTest();
        System.assertNotEquals(responsable.size(),0,'ok');
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition: 
     */
    @isTest
    static void getObjectFields_TEST()
    {
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Test.startTest();
        System.assertNotEquals(ProjetController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}