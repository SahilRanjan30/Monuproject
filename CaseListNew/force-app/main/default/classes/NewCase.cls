public with sharing class NewCase {
    public static void fun(String name)
    {
        List<Account>a = [SELECT name,Phone FROM Account WHERE Name =:name];
        for (Account acc : a) {
            if (acc.Name == name) {
                acc.Name='Microsoft Corporation';
            }
        }
        upsert a;
    }
}