public with sharing class FetchAccountDataClass {
    @AuraEnabled 
    public static Account fetch(String id){
        try {
            Account acc = [SELECT Name,Website,Description,AnnualRevenue FROM Account WHERE id =: id];
            System.debug(acc.Name + acc.Website+ acc.Description + acc.AnnualRevenue);
            return acc;
        } 
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Contact fetchRecord(String id){
        try {
        Contact conList = [SELECT Account.Name,Account.Website,Account.Description,Account.AnnualRevenue FROM Contact WHERE id =: id];
        return conList;
        }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Opportunity fetchOpportunity(String id){
        try {
            Opportunity opp = [SELECT Account.Name,Account.Website,Account.Description,Account.AnnualRevenue FROM Opportunity WHERE id =: id];
            return opp;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}