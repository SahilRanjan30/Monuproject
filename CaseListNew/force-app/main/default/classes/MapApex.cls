public with sharing class MapApex {
    //Program to find out missing element in the given range in the array/list in Apex.
    public static void missing_element(List<Integer> missingInteger,Integer low,Integer high,List<Integer> integerList)
    {
        Map<Integer,Integer> mp = new Map<Integer,Integer>();
        for (Integer val : integerList) {
            if (mp.containsKey(val)) {
                Integer value = mp.get(val);
                mp.put(val, value+1);
            }
            else {
                mp.put(val, 1);
            }
        }

        for (Integer i=low;i<=high;i++) {
            if (!mp.containsKey(i)) {
                missingInteger.add(i);
            }
        }
    }

    //Program to get frequency of every element in list in Apex.
    @AuraEnabled(cacheable=true)
    public static Map<Integer,Integer> mapFun(){
        List<Integer> ls = new List<Integer>();
        for (Integer i = 1; i < 11; i++){ 
            ls.add(i+10); 
        }
        List<Integer> missingInteger = new List<Integer>();
        Integer low = 10, high = 25;
        missing_element(missingInteger,low,high,ls);
        Map<Integer,Integer> mp = new Map<Integer,Integer>();

        for (Integer elem : ls) {
            if (mp.containsKey(elem)) {
                Integer value = mp.get(elem);
                mp.put(elem, value+1);
            }
            else {
                mp.put(elem, 1);
            }
        }
        System.debug(missingInteger);
        return mp;
    }
    
}