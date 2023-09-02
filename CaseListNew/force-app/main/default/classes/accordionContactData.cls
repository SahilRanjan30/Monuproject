public with sharing class accordionContactData {
    @AuraEnabled
    public static List<Account> fetchAccountData(){
        List<Account> acc = [SELECT Name,(SELECT Name,Email,Department,Phone from Contacts) FROM Account];
        List<Account> accList = new List<Account>();
        for (Account accLst : acc) {
            if (accLst.Contacts.size()>0) {
                accList.add(accLst);
            }
        }
        return accList;
    }
    public static void getRelatedAccountInfo() {
        List<Account> acco = [SELECT name,(SELECT Name FROM Contacts),(SELECT StageName FROM Opportunities) FROM Account];
        for (Account acc : acco) {
            if (acc.Contacts.size()>0 && acc.Opportunities.size()>0) {
                System.debug(acc.Name + acc.Contacts + acc.Opportunities);   
            }
        }
    }
    public static void getLeadInfo()
    {
        List<Lead> ldList = [SELECT Name,LeadSource FROM Lead];
        for (Lead ld : ldList) {
            System.debug(ld.Name + ld.LeadSource);
        }
    }
}