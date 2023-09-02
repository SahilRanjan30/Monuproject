public with sharing class GetRecord {
    @AuraEnabled
    public static SObject fetchRecordForSobject(Id Value){
            try {
                if (String.Valueof(Value.getSobjectType()) == 'Account') {
                    Account accList = [SELECT Name,Website,Description,AnnualRevenue FROM Account WHERE id =: Value];
                    return accList;
                }
                else if (String.Valueof(Value.getSobjectType()) == 'Contact') {
                    Contact conList = [SELECT Account.Name,Account.Website,Account.Description,Account.AnnualRevenue FROM Contact WHERE id =: Value];
                    return conList;
                }
                else if(String.Valueof(Value.getSobjectType()) == 'Case'){
                    Case caseList = [SELECT Account.Name,Account.Website,Account.Description,Account.AnnualRevenue FROM Case WHERE id =: Value];
                    return caseList;    
                }
                else {
                    Opportunity oppList = [SELECT Account.Name,Account.Website,Account.Description,Account.AnnualRevenue FROM Opportunity WHERE id =: Value];
                    return oppList;
                }
            } 
            catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }  
    }
}