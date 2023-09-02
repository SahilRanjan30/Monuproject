public with sharing class GetCaseStatus {

    @AuraEnabled(cacheable=true)
    public static List<String> getCasesByStatus(Id accountId) {
        Set<String> statusSet = new Set<String>();
        
        List<Case> cases = [SELECT Status
                            FROM Case
                            WHERE AccountId = :accountId];
        
        for (Case caseRecord : cases) {
            statusSet.add(caseRecord.Status);
        }
        
        return new List<String>(statusSet);
    }

    @AuraEnabled
    public static void updateCaseStatus(String caseId, String newStatus) {
        Case caseRecord = new Case(Id = caseId, Status = newStatus);
        update caseRecord;
    }
}