public with sharing class CaseStatusCount {
    public class AccountCaseWrapper {
    @AuraEnabled public String AccountName;
    @AuraEnabled public Map<String,list<Case>> CaseMap;
    }

    @AuraEnabled
    public static AccountCaseWrapper getCaseCounts(Id AccountId) {
         map<String,list<Case>> mp = new map<String,list<Case>>();  
         AccountCaseWrapper acc = new AccountCaseWrapper();
         List<Case> cs1 = [SELECT Id, Account.Name,Origin,Subject,Status FROM Case WHERE AccountId =: AccountId AND Status IN ('Open','Closed','In Progress','Escalated')];
         list<Case> caseListOpenStatus = new list<Case>();
         list<Case> caseListClosedStatus = new list<Case>();
         list<Case> caseListInProgressStatus = new list<Case>();
         list<Case> caseListEscalatedStatus = new list<Case>();
         for(Case cs : cs1){
            if(cs.Status == 'Open')
                caseListOpenStatus.add(cs);
            else if(cs.Status == 'Closed')
                caseListClosedStatus.add(cs);
            else if (cs.Status == 'Escalated') {
                caseListEscalatedStatus.add(cs);
            }
            else {
                caseListInProgressStatus.add(cs);  
            }
        }
        acc.AccountName = cs1[0].Account.Name;
        mp.put('Open',caseListOpenStatus);
        mp.put('Closed',caseListClosedStatus);
        mp.put('InProgress',caseListInProgressStatus);
        mp.put('Escalated', caseListEscalatedStatus);  
        acc.CaseMap = mp;
        return  acc;
    }
    
    @AuraEnabled
    public static String updateCaseStatus(String caseId, String newStatus) {
        Case updatedCaseStatus = [SELECT Id, Status FROM Case WHERE Id = :caseId];
        if (updatedCaseStatus != null && updatedCaseStatus.Status != newStatus) {
            updatedCaseStatus.Status = newStatus;
            update updatedCaseStatus;
            System.debug('Updated');
            return 'Success';
        }
        else {
            return 'Failure';
        }
    }
}