public with sharing class accountRetrieve {
    public static void getAccountDetails(String Name)
    {
        list<Account> a=[SELECT Name FROM Account WHERE Name = :Name LIMIT 1];
        System.debug(a);
    }
    public static List<Account> fetch(String state)
    {
        List<Account> b =[SELECT Name FROM Account WHERE Account.BillingState =:state LIMIT 2];
        return b;
    } 
}