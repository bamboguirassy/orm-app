/**
 * @author: Laye
 * @date: Creation: 28/05/2018
 * @description: class de teste d'AppController
 */
@isTest
public class AppController_Test {
	
    @testSetup
    static void setUp(){        
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de getUser
     */
    @isTest
    static void getUser_TEST(){
        String methodName='getUser';
        System.debug('### start- '+methodName);
        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de getUser
     */
    @isTest
    static void getProfile_TEST(){
        String methodName='getProfile';
        System.debug('### start- '+methodName);
        
        System.debug('### end- '+methodName);
    }
}