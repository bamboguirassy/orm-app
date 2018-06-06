/**
 * @author: Laye
 * @date: Creation: 06/06/2018
 * @description: class de teste des entite
 */
@isTest
public class EvidenceControllerTest {
	@testSetup
    static void setUp(){
		List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
		List<Contact> riskManagers = Orm_TestFactory.generateRiskManager(entites[0].Id);
		List<Risque_Entite__c> risqueDetectes = Orm_TestFactory.generateRisqueDetecte(risques[0].Id, riskManagers[0].Id, entites[0].Id);
		List<Plan_Action__c> actionsPlan = Orm_TestFactory.generatePlanActions(risqueDetectes, riskManagers[0].Id);
		List<Activite__c> activites = Orm_TestFactory.generateActivites(actionsPlan[0]);
        List<Mesure__c> mesures = Orm_TestFactory.generateMesureActivites(activites[0]);
		Orm_TestFactory.generateEvidences(mesures[0]);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 06/06/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Evidence__c evidence = [SELECT Id, evidenceOfActivity__c FROM Evidence__c limit 1];
		System.assertEquals(EvidenceController.findAll(evidence.evidenceOfActivity__c).size(), 20); 
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 06/06/2018
     * @description: methode de test de findAllByActivity
     */
    @isTest
    static void findAllByActivity_Test(){
        String methodName='findAllByActivity';
        System.debug('### start- '+methodName);
        Evidence__c evidence = [SELECT Id, evidenceOfActivity__c, evidenceOfActivity__r.activite__c FROM Evidence__c limit 1];
        System.assertEquals(EvidenceController.findAllByActivity(evidence.evidenceOfActivity__r.activite__c).size(), 20); 
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 06/06/2018
     * @description: methode de test de getElementByIdPreuve
     */
    @isTest
    static void getElementByIdPreuve_Test(){
        String methodName='getElementByIdPreuve';
        System.debug('### start- '+methodName);
        Id evidenceId = [SELECT Id FROM Evidence__c limit 1].Id;
        Evidence__c evidence = EvidenceController.getElementByIdPreuve(evidenceId);
        System.assertNotEquals(evidence.Id, null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 06/06/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);
        Id evidenceOfActivityId = [SELECT evidenceOfActivity__c FROM Evidence__c limit 1].evidenceOfActivity__c;
        Evidence__c evidence = EvidenceController.add(new Evidence__c(Name= 'Name', description__c= 'description', evidenceOfActivity__c= evidenceOfActivityId));
        System.assertNotEquals(evidence.Id, null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @date: Modification: 06/06/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);
		Evidence__c evidence = [SELECT Id, evidenceOfActivity__c FROM Evidence__c limit 1];
        Id evidenceOfActivityId = evidence.evidenceOfActivity__c;
        integer size = EvidenceController.findAll(evidenceOfActivityId).size();
		EvidenceController.remove(evidence);       
		System.assertEquals(EvidenceController.findAll(evidenceOfActivityId).size(), size-1); 
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 06/06/2018
     * @description: methode de test de findAllContentDocument
     */
    @isTest
    static void findAllContentDocument_Test(){
        String methodName='findAllContentDocument';
        System.debug('### start- '+methodName);
		Evidence__c evidence = [SELECT Id, evidenceOfActivity__c, evidenceOfActivity__r.activite__c FROM Evidence__c limit 1];
        List<ContentDocument> cds = EvidenceController.findAllContentDocument(evidence.evidenceOfActivity__r.activite__c);
        System.assertNotEquals(cds.size(), null);
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 06/06/2018
     * @description: methode de test de findAllContentDocumentByMesure
     */
    @isTest
    static void findAllContentDocumentByMesure_Test(){
        String methodName='findAllContentDocumentByMesure';
        System.debug('### start- '+methodName);
		Evidence__c evidence = [SELECT Id, evidenceOfActivity__c, evidenceOfActivity__r.activite__c FROM Evidence__c limit 1];
        List<ContentDocument> cds = EvidenceController.findAllContentDocumentByMesure(evidence.Id);
        System.assertNotEquals(cds.size(), null);
        System.debug('### end- '+methodName);
    }
    /**
     * @author: Laye
     * @date: Creation: 06/06/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        Map<String,String> fields = EvidenceController.getObjectFields();
        System.assertNotEquals(fields.size(), null);
        System.debug('### end- '+methodName);
    }
}