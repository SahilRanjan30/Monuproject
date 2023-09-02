public with sharing class createAccountContact {
   @AuraEnabled
   public static void addFile(List<Id> documentId, String accId){
    try {
        list<ContentDocumentLink> fileContent = new List<ContentDocumentLink>();
        if(String.isNotEmpty(accId)) {
            for(Id docId:documentId) {
                ContentDocumentLink linkObj = new ContentDocumentLink(ContentDocumentId = docId,LinkedEntityId = accId,Visibility = 'AllUsers');
                fileContent.add(linkObj);
            }
        }
        if (fileContent.size()>0) {
            insert fileContent;
        }
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
        } 
    }
}