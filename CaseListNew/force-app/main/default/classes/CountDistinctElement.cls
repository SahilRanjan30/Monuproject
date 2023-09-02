public with sharing class CountDistinctElement {
     public static void distinctElement() {
        List<Integer> lst = new List<Integer>();
        lst.add(1);
        lst.add(2);
        lst.add(1);
        lst.add(3);
        lst.add(4);
        lst.add(2);
        lst.add(3);
        countDistinct(lst,4);
    }
    
    public static void countDistinct(List<Integer> lst , integer n) {
        integer i=0,j=0,count=0,k=0,m=0;
        //Map<Integer, Integer> mapName = new Map<Integer, Integer>();
        Set<Integer> st = new Set<Integer>();
        List<Integer> resultList = new List<Integer>();
        while (j+1!=lst.size()) {
            while (k < n) {
                if (!st.contains(lst[k])) {
                    count++;
                    st.add(lst[k]);
                }
                k++;
            }
                //mapName.remove(lst[i]);
                st.clear();
                i++;
                j++;
                k=0;
                resultList.add(count);
                //For erasing the map elements.
                //mapName.clear();
                count = 0;
        }
        System.debug(resultList);
    }
}