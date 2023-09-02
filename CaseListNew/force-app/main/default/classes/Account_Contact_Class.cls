public class Account_Contact_Class {
	public static void createAccount(string a)
    {
        Account a1 = new Account();
        a1.name=a;
        insert a1;
    }
    public static void createContact(String Id, String ConFirstName, String ConLastName, String ConEmailId)
    {
        Contact c1= new Contact();
        c1.AccountId= Id;
        c1.Email=ConEmailId;
        c1.LastName=ConLastName;
        c1.FirstName=ConFirstName;
        insert c1;
    }
}