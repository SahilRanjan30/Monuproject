public with sharing class QUERY {
    @AuraEnabled
    public static List<Contact> contactData(Id recId)
    {
        List<Contact> con = [SELECT Name,Email,Phone FROM Contact WHERE AccountId =:recId];
        System.debug('Print'+con);
        return con;
    }
}