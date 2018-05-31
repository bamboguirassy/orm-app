/**
 * @author: David
 * @date: Creation: 28/05/2018
 * @description: class de teste des entite
 */
@isTest
public class EntiteController_Test {
	 @testSetup
    static void setup()
    {
		Orm_TestFactory.generateStructure();
    }
    /**
     * @author: David
     * @date: 25/05/2018
     * @descrition: recuperer la liste des entites
     */
    @isTest
    static void findAll_TEST(){
        String methodName='findAll';
        System.debug('### start- '+methodName);
        Test.startTest();
        List<Account> Entite=EntiteController.findAll();
        Test.stopTest();
        System.assertNotEquals(Entite.size(),0,'ok');
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
        Account entite=new Account(Name='entite',Phone='777');

        Account entite1 = null;

        if(entite!=null)
        	{
          entite.RecordTypeId=EntiteController.getStructureRecordTypeId();
       	  entite=EntiteController.add(entite);
            }

            
           EntiteController.add(entite);
           EntiteController.add(entite1);
           

        Test.stopTest();
        System.assertNotEquals(entite.Id,null,'ok');
        System.debug('### end- '+methodName);
    }  
    /**
     * @author: David
     * @date: 28/05/2018
     * @descrition:  
     */
    @isTest
    static void remove_TEST()
    {
        String methodName='remove';
        System.debug('### start- '+methodName);
        Test.startTest();
        Integer size=EntiteController.findAll().size();
        Account Entite=[select Id from Account limit 1];
        EntiteController.remove(Entite);
        Test.stopTest();
        System.assertEquals(EntiteController.findAll().size(),(size-1),'ok');
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 29/05/2018
     * @descrition: 
     */
    @isTest
   static void filterFromEntite_TEST()
    {
        String methodName='filterFromEntite';
        System.debug('### start- '+methodName);
        Test.startTest();
        String idEntite=[select Id from Account Limit 1].Id;
        List<Account> entites=EntiteController.filterFromEntite(idEntite);
        Test.stopTest();
        System.assertNotEquals(entites.size(),1,'ok');
        System.debug('### end- '+methodName);
    }
    /**
     * @author: David
     * @date: 29/05/2018
     * @descrition: 
     */
    @isTest
    static void getElementById_TEST()
    {
        String methodName='getElementById';
        System.debug('### start- '+methodName);
        Test.startTest();
        Id entiteId=[select Id from Account limit 1].Id;
        Account entite=EntiteController.getElementById(entiteId);
        Test.stopTest();
        System.assertNotEquals(entite,null,'ok');
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
        System.assertNotEquals(EntiteController.getObjectFields().size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}