public with sharing class FileUploadController {
      @AuraEnabled
    public static Id saveTheFiles(Id parentId, String fileName, String base64Data, String contentType)  
    { 
    system.debug('Saving chatter files '+fileName + ' '+ contentType);
    ContentVersion testContentInsert =new ContentVersion(); 
    testContentInsert.Title =fileName; 
    testContentInsert.VersionData=EncodingUtil.base64Decode(base64Data);
    testContentInsert.PathOnClient='/' + fileName ;
    insert testContentInsert; 

    system.debug('testContentInsert.id '+ testContentInsert.id);
    testContentInsert = [select id, ContentDocumentId from ContentVersion WHERE Id =: testContentInsert.Id];
    ContentDocumentLink cl = new ContentDocumentLink();
    cl.ContentDocumentId = testContentInsert.ContentDocumentId;
    cl.LinkedEntityId = parentId; 
    cl.ShareType = 'V';
    cl.Visibility = 'AllUsers';
    insert cl;

    system.debug('testContentInsert.id');
    return testContentInsert.id;

    }  

}