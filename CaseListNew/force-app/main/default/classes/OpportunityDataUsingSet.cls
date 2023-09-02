public with sharing class OpportunityDataUsingSet {
    @AuraEnabled
    public static String getOpportunity()
    {
        List<Opportunity> oppLst = [Select Id, Name, StageName, Type from Opportunity LIMIT 10];
        //Map<Id, Opportunity> OpportunityMap = new Map<Id, Opportunity>([Select Id, Name, StageName, Type from Opportunity LIMIT 10]);
       Set<Id> st = new Set<Id>();
        for (Opportunity opp : oppLst) {
            st.add(opp.Id);
        }
        System.debug(st);
        return JSON.serialize(st);
    }
}