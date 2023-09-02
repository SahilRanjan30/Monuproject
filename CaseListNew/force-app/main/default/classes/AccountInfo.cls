public with sharing class AccountInfo {
    @AuraEnabled
    public static List<Case> methodName(Id recId){
        try {
            List<Case>a=[SELECT id,Account.Name,Account.Phone,Account.AnnualRevenue,Account.Website,CaseNumber FROM case WHERE Id=:recId];
            return a;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}