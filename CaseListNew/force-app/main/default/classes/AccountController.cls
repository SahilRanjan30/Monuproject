public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts(string recordId) {
        return [SELECT Id, Name, Active__c FROM Account WHERE Id =:recordId];
      }	
}