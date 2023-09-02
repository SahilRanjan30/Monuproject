public with sharing class newAccount {
    public newAccount() {
        Account a= new Account(Name='Saket',Phone='8909854540');
        insert a;
    }
    public void deleteAccount(){
        Account[] record = [SELECT Id, Name FROM Account 
                         WHERE Name = 'Salesforce']; 
        try {
            delete record;
        } catch (DmlException e){
            System.debug(e.getMessage()); 
        }
    }
    public void updateRecord()
    {
    Account a = [SELECT Name,Phone FROM Account WHERE Name='Peter' LIMIT 1];
    a.Name = 'Salesforce';
    a.Phone = '9876453521';
    update a;
    }
}