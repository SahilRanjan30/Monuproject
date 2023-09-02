public with sharing class accountContactDetail {
    @AuraEnabled
    public static list<Contact> fetchAccountDetail(Id recId)
    {
        return [SELECT Id,FirstName,LastName,Email,Phone FROM Contact WHERE AccountId=:recId];
    }
}