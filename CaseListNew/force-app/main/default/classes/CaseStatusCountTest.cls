@isTest
public  class CaseStatusCountTest {
    static void testCaseCount(){
        List<Account> accounts = new List<Account>();
        Account account = new Account(Name='Test Account');
        accounts.add(account);  
        insert accounts;
        CaseStatusCount.getCaseCounts(accounts[0].Id);
    }
}