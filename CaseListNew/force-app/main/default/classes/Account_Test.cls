@isTest
private class Account_Test {
	@isTest static void test()
    {
        Account_Contact_Class.createAccount('Sahil');
        List<Account> accountList = [SELECT name from Account WHERE Name = 'Sahil'];	
        System.debug([SELECT id from account]);
        System.assertEquals(1,accountList.size());    
    }
    @isTest static void test1()
    {
        Account_Contact_Class.createAccount('Ranjan');
        list<account> a = [SELECT id from account where name='Ranjan' limit 1];
        Account_Contact_Class.createContact(a[0].id,'Sahil','Ranjan','sahil.ranjan@tugboat.in');
        list<Contact> contactList = [SELECT email from Contact WHERE email= 'sahil.ranjan@tugboat.in'];
        System.assertEquals(1, contactList.size());
    }
   /* @isTest static void test2()
    {
        list<account> a = [SELECT id from account where name='Ranjan' limit 1];
        Account_Contact_Class.createContact(a[0].id,'Sahil','Ranjan','sahil.ranjan@tugboat.in');
    }
	*/
}