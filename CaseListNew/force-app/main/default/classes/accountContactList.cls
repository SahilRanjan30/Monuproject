public with sharing class accountContactList {
    @AuraEnabled
    public static List<Account> getdetails(Id recId)
    {
        List<Account> acc= [SELECT id,Name,(SELECT firstname,lastname,Email,Phone FROM Contacts) FROM Account WHERE id=:recId];
        return acc;
    }
}