public with sharing class primeNumber {
    public primeNumber(integer n) {
        for(integer i=2;i<n;i++)
        {
            if(math.mod(n,i)==0)
                {
                    System.debug('Not Prime');
                    return;
                }
        }
        System.debug('Prime it is');
    }
}