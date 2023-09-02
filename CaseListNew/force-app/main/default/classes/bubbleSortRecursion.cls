public with sharing class bubbleSortRecursion {
    public void sortList(list<integer> a,integer b,integer c)
    {
        integer tmp;
        if (c<b) {
            for(integer j=0;j<b-1;j++)
            {
                if(a[j]>a[j+1])
                {
                    tmp=a[j];
                    a[j]=a[j+1];
                    a[j+1]=tmp;
                }
            }
            c+=1;
            sortList(a,b,c);
        }
        else {
            System.debug(a);
        }
    }
    public bubbleSortRecursion() {
        list<integer>a=new list<integer>();
        a.add(-12);
        a.add(1);
        a.add(102);
        a.add(1);
        a.add(14);
        a.add(4);
        a.add(2);
        a.add(0);
        a.add(-12);
        a.add(1);
        a.add(100);
        a.add(19);
        a.add(124);
        a.add(3);
        a.add(2);
        a.add(1);
        sortList(a,a.size(),0);
    }
}