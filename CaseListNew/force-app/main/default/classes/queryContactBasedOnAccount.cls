public with sharing class queryContactBasedOnAccount {
    @AuraEnabled
    public static List<Contact> contactData(id recId)
    {
        List<Contact> con = [SELECT Name,Email,Phone FROM Contact WHERE AccountId =:recId];
        System.debug(con);
        return con;
    }
}