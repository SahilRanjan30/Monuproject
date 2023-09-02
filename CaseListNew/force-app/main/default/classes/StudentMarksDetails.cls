public class StudentMarksDetails {
	public Map<string,integer> StudentMarksDetails(){
        Map<String,Integer> a=new Map<String,Integer>();
        integer sum=0;
        for(integer i=1;i<=10;i++)
        {
            a.put('Anurag',50+i);
            sum=sum+i;
        }
       /* a.put('Anurag',58);
        a.put('Sam',95);
		a.put('Harry',52);
        a.put('Potter',58);
        a.put('Paul',86); */
        return a;
    }
    public integer loop()
    {
        integer sum=0;
        for(integer i=1;i<=20;i++)
        {
            sum+=i;
        }
        return sum;
    }
}