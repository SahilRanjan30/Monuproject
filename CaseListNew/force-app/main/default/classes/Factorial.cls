public class Factorial {
	public integer result(integer n)
    {
        if(n==1||n==0)
            return 1;
        return n*result(n-1);
    }
}