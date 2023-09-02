public with sharing class queryContactDetails {
    @AuraEnabled
    public static List<Account> qry(Id recId)
    {
        List<Account>acc=[SELECT id, name,(SELECT firstname,lastname,phone FROM contacts) FROM Account WHERE Id=:recId];
        return acc;
    }
    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact() {
        return [SELECT Id, Name, Title, Phone, Email FROM Contact LIMIT 1];
    }
}