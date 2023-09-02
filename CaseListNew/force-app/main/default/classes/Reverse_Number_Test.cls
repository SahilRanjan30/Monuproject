@isTest
private class Reverse_Number_Test {
    @isTest static void test()
    {
	integer result=Reverse_Number.Number(12345);
    System.assertEquals(54321, result);
    }
    @isTest static void test1()
    {
        integer result2=Reverse_Number.Number(10000);
        System.assertEquals(1, result2);
    }
    @isTest static void test2()
    {
        integer result3=Reverse_Number.Number(930415821);
        System.assertEquals(128514039, result3);
        
    }
	@isTest static void test3()
    {
        integer result4=Reverse_Number.Number(0);
        System.assertEquals(0, result4);
    }    
}