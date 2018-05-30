/**
 * @author: Laye
 * @date: Creation: 29/05/2018
 * @description: class de test de RevuePCController
 */
@isTest
public class RevuePCController_Test {
	@testSetup
    static void setUp(){        
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findFromProcessus
     */
    @isTest
    static void findFromPartieConcernee_Test(){
        String methodName='findFromProcessus';
        System.debug('### start- '+methodName);        
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
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
}