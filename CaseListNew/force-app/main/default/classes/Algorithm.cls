public class Algorithm {
    public integer reverseNumber(integer N)
    {
        integer rem,rev=0;
        while(N>0)
        {
            rem=math.mod(N,10);
            rev=rev*10+rem;
            N/=10;
        }
        return rev;
    }
	public void find(integer low,integer high,integer key)
    {
        integer result,answer;
        list<integer> a=new list<integer>();
        for(integer i=low;i<=high;i++)
        {
            result=reverseNumber(i);
            answer=i-result;
            integer result1=math.mod(answer, key);
          //	System.debug(result1);
            if(result1==0)
            {
                //System.debug(i);
                a.add(i);
            }
        }
        System.debug(a);
    }
}