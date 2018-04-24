@IsTest
public class TestAppController {
    
    static testMethod void testApp(){
         Test.startTest();
        
        System.assert(AppController.getProfile()!=null);
        System.assert(AppController.getUser()!=null);
         
        Test.stopTest();
    }
}