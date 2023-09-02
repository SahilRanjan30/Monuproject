public with sharing class searchFunctionality {
    @AuraEnabled(cacheable=true)
    public static list<contact> getContactList(string searchKey) {
        string searchKeyword =   '%'+searchKey+'%' ;
        list<contact> contactListRecord = new list<contact>();
        contactListRecord = [Select id,Name,Email,Phone From Contact WHERE name LIKE : searchKeyword]; 
        return contactListRecord;
    }

    @AuraEnabled
    public static List<Contact> searchContact(string searchKey){
        try {
            //string searchKeyword =   '%'+searchKey+'%' ;
            list<contact> contactListRecord = new list<contact>();
            contactListRecord = [SELECT Name, Phone, Email,AccountId FROM Contact WHERE AccountId = NULL AND Name =: searchKey]; 
            System.debug(contactListRecord);
            if (contactListRecord.size()>0) {
                return contactListRecord;
            }
            return NULL;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String createContact(string Fname, String Lname,string Email,String Phone, Id AccountId){
        Contact a = new Contact();
        try {
            a.FirstName=Fname;
            a.LastName=Lname;
            a.Email=Email;
            a.Phone=Phone;
            a.AccountID=AccountId;
            insert a;
            System.debug('Contact Created Successfully');
            return a.Id;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void getAccountContact(){ 
        List<Account> accountList = [SELECT name,(SELECT Phone FROM Contacts) FROM Account];
        list<Contact> ContactList = new List<Contact>(); 
        //List<Contact> conList = new List<Contact>();
        for(Account a : accountList)
        {
           for(Contact c : a.Contacts)
            {
               ContactList.add(c);     
            }
        }
        System.debug(ContactList.size());
       /* for(Account a : accountList)
        {
           for(Contact c : a.Contacts)
            {
               conList.add(c);     
            }
        }
        
        System.debug(contactList);
        if (ContactList.size() == conList.size()) {
            System.debug('List are equal');
        }
        else {
            System.debug('List are not equal');
        }
        */
    } 
}