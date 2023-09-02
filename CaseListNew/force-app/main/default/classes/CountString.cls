public class CountString {
	public void findStringArray()
    {
        list<string> a= new string[]{'abc','cdf','abc','efg','abc','cdf','cdf','abc'};
        list<string> b= new string[]{'abc','xyz','cdf'};
     /*   map<string,integer> c=new map<string,integer>();
		for(integer i=0;i<b.size();i++)
        {
            integer count=0;
            for(integer j=0;j<a.size();j++)
            {
                if(b[i]==a[j])
                {
                    count+=1;
                }
            }
            c.put(b[i],count); //Inserting the element into the map.
        }
        System.debug(c); */
        try{
        map<string,integer> mp=this.convertListToMap(a);
        System.debug(mp);
        }
        catch(Exception e)
        {
            System.debug(e.getMessage());
        }
    }
    public Map<string,integer> convertListToMap(list<string> a)
    {
        Map<string,integer> mp=new Map<string,integer>();
        for(string str : a)
        {
            integer count;
            count=mp.get(str);
            if(count==NULL)
            {
                mp.put(str, 1);
            }
            else
            {
                mp.put(str, count+1);
            }
        }
        return mp;
        }
}