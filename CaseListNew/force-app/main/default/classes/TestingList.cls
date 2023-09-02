public class TestingList {
	public TestingList()
    {
        map<integer,string>m=new map<integer,string>();
        m.put(12,'A');
        m.put(19,'B');
        m.put(100,'C');
        System.debug(m);
        //clear(m);
        System.debug(m.containsKey(1999));
        System.debug('\n');
        System.debug(m.remove(100));
        System.debug(m.remove(12));
        System.debug(m);
    }
}