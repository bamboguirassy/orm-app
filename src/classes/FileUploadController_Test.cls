/**
 * @author: Laye
 * @date: Creation: 29/05/2018
 * @description: class de teste de FileUploadController
 */
@isTest
public class FileUploadController_Test {
	@testSetup
    static void setUp(){        
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de saveChunk
     */
    @isTest
    static void saveChunk_Test(){
        String methodName='saveChunk';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test d'appendToFile
     */
    @isTest
    static void appendToFile_Test(){
        String methodName='appendToFile';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
    
    /**
     * @author: Laye
     * @date: Creation: 29/05/2018
     * @description: methode de test de findByMesure
     */
    @isTest
    static void findByMesure_Test(){
        String methodName='findByMesure';
        System.debug('### start- '+methodName);        
        System.debug('### end- '+methodName);
    }
}