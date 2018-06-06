/**
 * @author: Dibocor
 * @date: Creation: 31/05/2018
 * @description: class de test d'ImpactRisqueController
 */
@isTest
public class ImpactRisqueEntiteController_Test {
	@testSetup
    static void setUp(){   
    	//Orm_TestFactory.generateImpactRisqueEntite();     
    }
    
    /**
     * @author: Dibocor
     * @date: Creation: 31/05/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Dibocor
     * @date: Creation: 31/05/2018
     * @description: methode de test d'add
     */
    @isTest
    static void add_Test(){
        String methodName='add';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Dibocor
     * @date: Creation: 31/05/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Dibocor
     * @date: Creation: 31/05/2018
     * @description: methode de test de getImpacts
     */
    @isTest
    static void getImpacts_Test(){
        String methodName='getImpacts';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
}