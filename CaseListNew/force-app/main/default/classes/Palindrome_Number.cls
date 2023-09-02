public with sharing class Palindrome_Number {
    public void palindrome_Number(integer n) {
        integer result=n,rem,rev=0;
        while (n!=0) {
            rem=math.mod(n,10);
            rev=rev*10+rem;
            n/=10;
        }
        if(result == rev)
            System.debug('Palindrome Number');
        else {
            System.debug('Not a Palindrome Number');
        }
    }
}