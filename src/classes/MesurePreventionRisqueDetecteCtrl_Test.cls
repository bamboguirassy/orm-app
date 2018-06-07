/**
 * @author: David
 * @date: Creation: 06/06/2018
 * @description: class de test de MesurePreventionRisqueDetecteController
 */
@isTest
public class MesurePreventionRisqueDetecteCtrl_Test {
	@testSetup
    static void setUp(){
    	 List<Account> entites = Orm_TestFactory.generateStructure();
        List<Categorie_Risque__c> categories = Orm_TestFactory.generateCategorieRisque();
		List<Risque__c> risques = Orm_TestFactory.generateRisque(categories);
         List<Categorie_Mesure_Prevention__c> CategorieMesurePrevention=Orm_TestFactory.generateCategorieMesurePrevention();      
   		List<mesure_Prevention__c> mesuresPreventions = Orm_TestFactory.generateMesurePrevention(CategorieMesurePrevention[0].id,risques[0].id);
		List<ParamRisqueEntite__c> paramRisques = Orm_TestFactory.generateParamRisqueEntite( entites[0].Id, risques[0].Id);  
		Orm_TestFactory.generateMesurePreventionRisqueDetecte( paramRisques[0].Id, mesuresPreventions[0].Id);
		        
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
		        string  paramRisqueId=[select Id from ParamRisqueEntite__c limit 1].Id;
		        List<Mesure_Prevention_Risque_Detecte__c> mesurePreventionRisqueDetectes=MesurePreventionRisqueDetecteController.findAll(paramRisqueId);
          Test.stopTest();
          System.assertNotEquals(mesurePreventionRisqueDetectes.size(),0,'ok');        
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
          string  paramRisqueId=[select Id from ParamRisqueEntite__c limit 1].Id;
          string mesurePreventionId= [select Id from mesure_Prevention__c limit 1].Id;
        
           Mesure_Prevention_Risque_Detecte__c mesurePreventionRisqueDetecte=new Mesure_Prevention_Risque_Detecte__c(risk_tracking_parameter__c=paramRisqueId,mesure_Prevention__c=mesurePreventionId);

           MesurePreventionRisqueDetecteController.add(mesurePreventionRisqueDetecte);
        Test.stopTest();
        System.assertNotEquals(mesurePreventionRisqueDetecte.Id,null,'ok');       
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
        string  paramRisqueId=[select Id from ParamRisqueEntite__c limit 1].Id;
        Integer size=MesurePreventionRisqueDetecteController.findAll(paramRisqueId).size();
        Mesure_Prevention_Risque_Detecte__c mesurePreventionRisqueDetecte=[select Id from Mesure_Prevention_Risque_Detecte__c limit 1];
        MesurePreventionRisqueDetecteController.remove(mesurePreventionRisqueDetecte);
        Test.stopTest();
        System.assertEquals(MesurePreventionRisqueDetecteController.findAll(paramRisqueId).size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: David 
     * @date: Creation: 06/06/2018
     * @description: methode de test de getMesurePreventions
     */
    @isTest
    static void getMesurePreventions_Test(){
        String methodName='getMesurePreventions';
        System.debug('### start- '+methodName);
          Test.startTest(); 
		        string  risqueId=[select Id from Risque__c limit 1].Id;
		        List<Mesure_Prevention__c> mesurePreventions=MesurePreventionRisqueDetecteController.getMesurePreventions(risqueId);
          Test.stopTest();
          System.assertNotEquals(mesurePreventions.size(),0,'ok');      
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: Creation: 06/06/2018
     * @description: methode de test de getObjectFields
     */
    @isTest
    static void getObjectFields_Test(){
        String methodName='getObjectFields';
        System.debug('### start- '+methodName);
        System.assertNotEquals(MesurePreventionRisqueDetecteController.getObjectFields().size(), null);
        System.debug('### end- '+methodName);
    }
}