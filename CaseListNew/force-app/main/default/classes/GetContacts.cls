public with sharing class GetContacts {
    @AuraEnabled
    public static list<Contact> GetContacts(Id recId) {
        List<Contact>acc=[SELECT id, name, firstname,lastname,phone,AccountId FROM Contact WHERE AccountId=:recId];
        return acc;
    }
    public static list<Account> fetchAccountDetail(Id recId)
    {
        List<Account>account= [SELECT Name,(SELECT firstname,lastname FROM Contacts) FROM Account WHERE id=: recId];
        return account;
    }
}