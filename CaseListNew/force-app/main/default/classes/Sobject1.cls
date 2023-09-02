public with sharing class Sobject1 {
    public Sobject1() {
        Account a = new Account();
        sObject s = [SELECT Id, Name FROM Account WHERE Name = 'ACME2' LIMIT 1];
        ID id = s.ID;
        Account convertedAccount = (Account)s;
        convertedAccount.name = 'Acme2';
        update convertedAccount;
    }
}