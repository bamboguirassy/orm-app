/**
 * @author: David
 * @date: Creation: 28/05/2018
 * @description: class de teste des entite
 */
@isTest
public class EvidenceController_Test {
	@testSetup
    static void setUp(){        
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
     * @description: methode de test de findAll
     */
    @isTest
    static void findAll_Test(){
        String methodName='findAll';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 28/05/2018
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
     * @date: Creation: 28/05/2018
     * @description: methode de test de remove
     */
    @isTest
    static void remove_Test(){
        String methodName='remove';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
}