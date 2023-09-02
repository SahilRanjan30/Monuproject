public with sharing class ContactData {
    @AuraEnabled
    public static Contact createNewContact(string Fname, String Lname,string Email,String Phone, Id AccountId){
        Contact a = new Contact();
        try {
            a.FirstName=Fname;
            a.LastName=Lname;
            a.Email=Email;
            a.Phone=Phone;
            a.AccountID=AccountId;
            insert a;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return a;
    }
    
}