public with sharing class accountContactWrapperClass {
    public class accountContactList
    {
        public String accName;
        public List<Account> AccountList;
        public List<Contact> ContactList;
    }
    @AuraEnabled
    public static accountContactList getAccountContactInfo(Id Account){
        accountContactList cls = new accountContactList();
        List<Account> accLst = new List<Account>();
        accLst=[SELECT id,name,AccountNumber,(SELECT name,Phone,Email FROM Contacts) FROM Account LIMIT 10];
        System.debug(accLst);
        cls.AccountList=accLst;
        //conLst=[SELECT id,name,Phone,Email FROM Contact LIMIT 10];
        return cls;
    }

    
}