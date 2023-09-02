@isTest
private class Sum_Recursion_Test {
    @isTest static void test()
    {
        integer answ = Sum_Recursion.sumRecursion(1991);
        System.assertEquals(20, answ);
    }
    @isTest static void test1()
    {
        integer ans1 = Sum_Recursion.sumRecursion(2003);
        System.assertEquals(5, ans1);
    }
    @isTest static void test2()
    {
        integer ans2 = Sum_Recursion.sumRecursion(2022);
        System.assertEquals(6, ans2);
    }
    @isTest static void test3()
    {
        integer ans3 = Sum_Recursion.sumRecursion(2025);
        System.assertEquals(9, ans3);
    }
    @isTest static void test4()
    {
        integer ans4 = Sum_Recursion.sumRecursion(9999);
        System.assertEquals(36, ans4);
    }
}