/**
 * @author: Laye
 * @date: Creation: 28/05/2018
 * @description: class de teste de ChartProcessusController
 */
@isTest
public class ChartProcessusController_Test {
	@testSetup
    static void setUp(){        
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de processusByEntite
     */
    @isTest
    static void processusByEntite_TEST(){
        String methodName='processusByEntite';
        System.debug('### start- '+methodName);
        Test.startTest();
        string annee='2018';
        System.assertNotEquals(ChartProcessusController.processusByEntite(annee).size(),0,'ok');
        Test.stopTest();
        System.debug('### end- '+methodName);
    }
}