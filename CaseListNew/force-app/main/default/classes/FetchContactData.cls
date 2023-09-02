public with sharing class FetchContactData {
    @AuraEnabled
    public static List<Contact> contactData(string recId)
    {
        List<Contact> con = [SELECT Name,Email,Phone FROM Contact WHERE AccountId =:recId];
        return con;
    }
    @AuraEnabled
    public static boolean updateContact(list<Contact> conLst)
    {
        integer count = 0;
        try {
            System.debug('Updated Contact List: '+conLst);
            if(conLst.size()>0){
                update conLst;
                count =1;
            }
        } catch (Exception e) {
            System.debug(e.getCause());
            count = 0;
        }
        if(count == 1)
            return true;
        return false;
    }
}