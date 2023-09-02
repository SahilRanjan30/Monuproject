public with sharing class reverseNumberUsingRecursion {
    public void Recursion(integer n,integer rev) {
        if(n==0)
            System.debug(rev);
        else {
            rev=rev*10+math.mod(n,10);
            Recursion(n/10,rev);
        }
    }
}