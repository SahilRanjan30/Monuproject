public class AccountCreation {
	public static void create()
    {
        list<Account>a= new list<Account>();
        for(integer i=1;i<=200;i++)
        {
            Account b = new Account();
            b.Name='SALESFORCE'+ i;
            a.add(b);
        }
        insert(a);
    }
    public static void test(String a)
    {
        list<Account> s;
		for (integer i = 0; i <50; i++)
		{
    		s= [SELECT name FROM Account WHERE name =: a];
		}
        System.debug(s);
    }
}