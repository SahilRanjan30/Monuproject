public with sharing class CountDigits {
    public void count(integer n,integer count) {
        if(n==0)
        {
            System.debug(count);
            return;
        }
        else
        {
            count++;
            Count(n/10,count);
        }
    }
}