public with sharing class ManageCaseStatusOnAccount {
    public class caseStatus {
        @AuraEnabled public map<String,list<Case>> caseMap;
        @AuraEnabled public Integer openCasesCount;
        @AuraEnabled public Integer closeCasesCount;
        @AuraEnabled public Integer inProgressCasesCount;
    }
    @AuraEnabled
    public  static caseStatus getCase(String recId) {
        try {
            caseStatus caseWrapperClass = new caseStatus();
            map<String,list<Case>> mp = new map<String,list<Case>>();
            List<Case> cs1 = [SELECT Id, Description, Owner.Name,Status FROM Case WHERE AccountId =: recId AND Status IN ('Open','Closed','In Progress')];
            list<Case> caseListOpenStatus = new list<Case>();
            list<Case> caseListClosedStatus = new list<Case>();
            list<Case> caseListInProgressStatus = new list<Case>();
            for(Case cs : cs1){
                if(cs.Status == 'Open')
                    caseListOpenStatus.add(cs);
                else if(cs.Status == 'Closed')
                    caseListClosedStatus.add(cs);   
                else
                    caseListInProgressStatus.add(cs);
            }
            System.debug(caseListOpenStatus);
            System.debug(caseListClosedStatus);
            System.debug(caseListInProgressStatus);
            caseWrapperClass.openCasesCount=caseListOpenStatus.size();
            caseWrapperClass.closeCasesCount=caseListClosedStatus.size();
            caseWrapperClass.inProgressCasesCount = caseListInProgressStatus.size();
            caseWrapperClass.caseMap.put('Open',caseListOpenStatus );
            caseWrapperClass.caseMap.put('Close',caseListClosedStatus );
            caseWrapperClass.caseMap.put('In Progress',caseListInProgressStatus );
            return caseWrapperClass;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string updateCases(Object data) {
        List<Case> caseList = (List<Case>) JSON.deserialize( JSON.serialize(data), List<Case>.class);
        try {
            update caseList;
            return 'Success';
        }
        catch (Exception e) {
            return  e.getMessage();
        }
    }

}