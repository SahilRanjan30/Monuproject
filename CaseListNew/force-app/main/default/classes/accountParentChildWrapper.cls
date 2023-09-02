public with sharing class accountParentChildWrapper {
     public class AccountRelatedData {
      @AuraEnabled  public Integer opportunityCount;
      @AuraEnabled  public Integer contactCount;
      @AuraEnabled  public Integer casesCount;
      @AuraEnabled  public Integer taskCount;

     }

     /* public AccountRelatedData(Integer oppCount, Integer conCount, Integer caseCount, Integer taskCnt)
      {
            this.opportunityCount = oppCount;
            this.contactCount = conCount;
            this.casesCount = caseCount;
            this.taskCount = taskCnt;
      }
      */
      
    @AuraEnabled
    public static AccountRelatedData getrelatedAccountData(String recId){
        System.debug('recId '+recId);
        try {
            AccountRelatedData acc1 = new AccountRelatedData();
            List<Account> acc = [SELECT Id, (SELECT Name FROM Contacts), (SELECT Name FROM Opportunities), (SELECT id FROM Tasks), (SELECT id FROM Cases) FROM Account WHERE Id =: recId];
            //System.debug(acc.size());
            Account accObj = acc[0];
            List<Contact> conLst = accObj.Contacts;
            acc1.contactCount = conLst.size();
            List<Opportunity> oppLst = accObj.Opportunities;
            acc1.opportunityCount = oppLst.size();
            List<Task> tskLst = accObj.Tasks;
            acc1.taskCount = tskLst.size();
            //List<Cases> caseLst = accObj.Cases();
            //acc1.casesCount = caseLst.size();
            //System.debug(acc1.casesCount);
            //System.debug(acc1.opportunityCount);
            //System.debug(acc1.taskCount);
           // System.debug(acc1.contactCount);
            
            /*List<Integer> lst = new List<Integer>();
            lst.add(acc1.contactCount);
            lst.add(acc1.opportunityCount);
            lst.add(acc1.taskCount);
            System.debug(lst);
            */
            return acc1;
            
        }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}