public class SetOperation {
	public void SetOperation()
    {
        List<string> ls = new List<string>();
        ls.add('Sahil');
        ls.add('Xyz');
        boolean x=ls.contains('abc');
        System.assertEquals(false, x);
    }
}