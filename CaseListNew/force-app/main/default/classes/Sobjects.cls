public with sharing class Sobjects {
    public Sobjects() {
    list<Account> a = [SELECT Name,Test_field_creation__c FROM Account];
        list<Account> updatedA = new list<Account>();
        system.debug(a);
        system.debug(a.size());
        for(Account acct: a){
            System.debug(acct.Name + ':' + acct.Test_field_creation__c);
            acct.Test_field_creation__c = 'Practice';
            updatedA.add(acct);
        }
        update updatedA;
        list<Account> b= [SELECT Phone FROM Account];
        list<Account> updatedB = new list<Account>();
        System.debug(b);
        for(Account acc: b)
        {
            acc.Phone='5678934';
            updatedB.add(acc);
        }
        update updatedB;
        }
}