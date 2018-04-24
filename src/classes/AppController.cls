public with sharing class AppController {
    
    @AuraEnabled
    public static User getUser(){
        return [Select FirstName,LastName,CompanyName,Username from User where Id=:UserInfo.getUserId()];
    }
    
    @AuraEnabled
    public static Profile getProfile(){
        return [select Name from Profile where Id=:UserInfo.getProfileId()];
    }
    
   
   
    
}