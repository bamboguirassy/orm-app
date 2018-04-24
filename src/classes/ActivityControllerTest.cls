@IsTest
public class ActivityControllerTest {
    
    static testMethod void test(){
        List<Activite__c> items=new List<Activite__c>();
        for(Integer i=0;i<20;i++){
            Activite__c item=new Activite__c();
            item.date__c=System.today();
            item.delai__c=System.today();
            item.Name='1';
            items.add(item);
            ActiviteController.add(item);
        }
        
        Test.startTest();
        for(Integer i=0;i<20;i++){
            Activite__c item=new Activite__c();
            item.date__c=System.today();
            item.delai__c=System.today();
            item.Name='1';
            items.add(item);
            item=ActiviteController.add(item);
            System.assert(item.Id!=null);
        }
        Test.stopTest();
    }
    
}