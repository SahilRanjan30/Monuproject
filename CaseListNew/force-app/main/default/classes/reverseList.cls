public with sharing class reverseList {
     public static void reverse(List<Integer> nums) {
        Integer tmp;
        for (Integer i = 0; i < nums.size()/2; i++) {
            tmp=nums[i];
            nums[i]=nums[nums.size()-1-i];
            nums[nums.size()-1-i]=tmp;
        }

        System.debug(nums);

    }
}