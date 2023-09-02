public class Print_Reverse_Recursion {
    public void print_elements()
    {
        List<Integer> a = new List<Integer>();
        for(integer i=1;i<=10;i++)
        {
            a.add(10+i);
        }
        integer size=a.size();
        for(integer i=size-1;i>=0;i--)
        {
            System.debug(a[i]);
        }
    }
}