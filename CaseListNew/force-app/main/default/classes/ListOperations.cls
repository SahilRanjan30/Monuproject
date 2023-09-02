public with sharing class ListOperations {
    public ListOperations() {
        list<integer> a=new list<integer>();
        integer k=10;
        for(integer i=1;i<=10;i++)
            a.add(k+i);
        System.debug(a);
        System.debug('\n');
        integer sizeList=a.size(),c,sum=0;
        for(integer i=0;i<sizeList/2;i++)
        {
            c=a[i];
            sum=sum+c+a[sizeList-1-i];
            a[i]=a[sizeList-1-i];
            a[sizeList-1-i]=c;
        }
        System.debug(a);
        System.debug('\n');
        System.debug(sum);
    }
    public void isPrime(integer n)
    {
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