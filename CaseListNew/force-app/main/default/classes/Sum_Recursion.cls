public with sharing class Sum_Recursion {
    public static integer sumRecursion(integer k) {
        if(k==0)
            return 0;
        else {
            return math.mod(k,10)+sumRecursion(k/10);
        }
    }
}