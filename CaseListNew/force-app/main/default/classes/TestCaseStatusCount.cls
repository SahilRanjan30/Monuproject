@isTest
public  class TestCaseStatusCount{
    @isTest
	public class AccountCaseWrapper {
		@AuraEnabled public String AccountName;
		@AuraEnabled public Map<String,list<Case>> CaseMap;
		}
	 static void testCaseStatus(){
		
        //List<Account> accountList = new List<Account>();
		List<Account> acc = new List<Account>();
		Account tst = new Account(Name = 'Test');
        insert tst;
		AccountCaseWrapper wrap = new AccountCaseWrapper();
		AccountCaseWrapper = CaseStatusCount.getCaseCounts(tst.Id);
		System.assertEquals(AccountCaseWrapper, AccountCaseWrapper);
	}
}