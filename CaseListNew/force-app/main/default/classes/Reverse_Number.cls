public with sharing class Reverse_Number {
    public static integer Number(integer N) {
        integer rem,rev=0;
        while(N!=0)	
        {
            rem=math.mod(N,10);
            rev=rev*10+rem;
            N/=10;
        }
        return rev;
    }
}