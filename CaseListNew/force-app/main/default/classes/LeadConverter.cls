public class LeadConverter {
    @AuraEnabled
    public static void convertLeadToAccountAndOpportunity(Id leadId)
    {
        
        try {
            Database.LeadConvert lc = new database.LeadConvert();
            lc.setLeadId(leadId);
            LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
            lc.setConvertedStatus(convertStatus.MasterLabel);
            lc.setDoNotCreateOpportunity(FALSE);
            Database.LeadConvertResult lcr = Database.convertLead(lc); 
            id accountId;
            id OpportunityId;
            if(lcr.isSuccess())
            {
                accountId = lcr.getAccountId();
                OpportunityId = lcr.getOpportunityId();
                /*Patient_Account__c acc = new Patient_Account__c();
                Lead lst = [SELECT Diab__c,Payor__c,Prescribing_HCP__c,Inserting_HCP__c,Sensor_Type__c FROM Lead WHERE Id = :leadId];
                acc.Diabetes_Type__c = lst.Diab__c;
                acc.Inserting_HCP__c = lst.Inserting_HCP__c;
                acc.Payor__c = lst.Payor__c;
                acc.Prescribing_HCP__c = lst.Prescribing_HCP__c;
                acc.Sensor_Type__c = lst.Sensor_Type__c;  
                insert acc;  
                */
            }
            } 
            catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }       
    }
}