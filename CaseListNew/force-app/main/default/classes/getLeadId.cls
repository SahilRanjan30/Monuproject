public with sharing class getLeadId {
    public static list<Lead> getLeadId() {
        List<Lead> leadList = [SELECT Id FROM Lead];
        return leadList;
    }
}