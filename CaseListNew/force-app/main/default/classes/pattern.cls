public with sharing class pattern {
    public pattern() {
        for(integer i=1;i<=5;i++)
        {
            for(integer j=1;j<=5;j++)
            {
                if(j<=i)
                    System.debug('*');
                else {
                    System.debug(' ');
                }
            }
            System.debug('\n');
        }
    }
}