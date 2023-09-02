public with sharing class retrieveAccountRecord {
    @AuraEnabled
    public static list<Account> getAccount()
    {
        return [SELECT id,name,phone FROM Account];
    }
}