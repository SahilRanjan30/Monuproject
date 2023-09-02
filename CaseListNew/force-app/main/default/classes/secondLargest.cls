public with sharing class secondLargest {
    public secondLargest() {
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
        a.add(1000000000);
        integer largest=a[0];
        for(integer i=0;i<a.size();i++)
        {
            if(a[i]>largest)
                largest=a[i];
        }
        System.debug(largest);
    }
}