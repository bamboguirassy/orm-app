/**
 * @author: Laye
 * @date: Creation: 29/05/2018
 * @description: class de test d'IntervenantProjetController
 */
@isTest
public class IntervenantProjetController_Test {
	@testSetup
    static void setUp(){  
    	List<Account> structures = Orm_TestFactory.generateStructure();       
    	List<Contact>  responsables = Orm_TestFactory.generateRiskManager(structures[0].Id);       	
    	List <Projet__c> projets = Orm_TestFactory.generateProjet(structures[0].Id,responsables[0].Id);
    	Orm_TestFactory.generateIntervenantProjet(projets[0].id,responsables[0].id);      
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);  
         Test.startTest();
         string projet= [select id from Projet__c limit 1].Id;
        List<IntervenantProjet__c> IntervenantProjets=IntervenantProjetController.findAll(projet);
        Test.stopTest();
        System.assertNotEquals(IntervenantProjets.size(),0,'ok');       
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de getIntervenants
     */
    @isTest
    static void getIntervenants_Test(){
        String methodName='getIntervenants';
        System.debug('### start- '+methodName);  
        Test.startTest();
		string entiteId=[select id from Account limit 1].id;
        List<Contact> intervenants=IntervenantProjetController.getIntervenants(entiteId);
        Test.stopTest();
        System.assertNotEquals(intervenants.size(),0,'ok');      
        System.debug('### end- '+methodName);
    }
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test getIntervenantsEdit
     */
    @isTest
    static void getIntervenantsEdit_Test(){
        String methodName='getIntervenantsEdit';
        System.debug('### start- '+methodName);  
        Test.startTest();
		string entiteId=[select id from Account limit 1].id;
		string IntervenantId = [select id from IntervenantProjet__c limit 1].Id;
        List<Contact> intervenants=IntervenantProjetController.getIntervenantsEdit(entiteId,IntervenantId);
        Test.stopTest();
        System.assertNotEquals(intervenants.size(),0,'ok'); 
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);  
        Test.startTest();
        string idProjet=[select id from Projet__c limit 1].Id;
        string idIntervenant=[select id from Contact limit 1].Id;
        
           IntervenantProjet__c IntervenantProjet=new IntervenantProjet__c(Role__c='role',Project__c=idProjet,Intervenant__c=idIntervenant); 
           IntervenantProjetController.add(IntervenantProjet);
           
        Test.stopTest();
        System.assertNotEquals(IntervenantProjet.Id,null,'ok');          
        System.debug('### end- '+methodName);
    }
    
        /**
     * @author: DAVID
     * @date: Creation: 04/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);  
         Test.startTest();
         string projet = [select id from Projet__c limit 1].Id;
        Integer size=IntervenantProjetController.findAll(projet).size();
        IntervenantProjet__c intervenant=[select Id from IntervenantProjet__c limit 1];
        IntervenantProjetController.remove(intervenant);
        Test.stopTest();
        System.assertEquals(IntervenantProjetController.findAll(projet).size(),(size-1),'ok');      
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David
     * @date: 04/06/2018
     * @descrition: 
     */
    @isTest
    static void getElementById_TEST()
    {
        String methodName='getElementById';
        System.debug('### start- '+methodName);
       Test.startTest();
        Id intervenantId=[select Id from IntervenantProjet__c limit 1].Id;
        IntervenantProjet__c intervenant=IntervenantProjetController.getElementById(intervenantId);
        Test.stopTest();
        System.assertNotEquals(intervenant,null,'ok');
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
        System.assertNotEquals(IntervenantProjetController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}