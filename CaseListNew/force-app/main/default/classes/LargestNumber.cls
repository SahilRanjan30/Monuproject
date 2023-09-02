public class LargestNumber {
	public void LargestNumber()
    {
        integer [] nums=new integer[]{-10,-14,1,19,-2};
        integer largestNumber=nums[0],sum=0,smallestNumber=nums[0],result1,result2;
        for(integer i=0;i<nums.size();i++)
        {
            sum+=nums[i];
            if(nums[i]>largestNumber)
                largestNumber=nums[i];
            if(nums[i]<smallestNumber)
                smallestNumber=nums[i];
        }
        result1=sum-smallestNumber;
        result2=sum-largestNumber;
        System.debug(result1);
        System.debug(result2);
    }
    public integer average()
    {
        integer [] nums=new integer[]{12,56,90,56,78,120};
        integer sum=0;
        for(integer i=0;i<nums.size();i++)
        {
            sum+=nums[i];
        }
        return sum/nums.size();
    }
    public void sort()
    {
        integer [] nums=new integer[]{12,56,90,56,78,120,0,-9,-90,-200};
        integer [] nums1=new integer[]{12,56,90,56,78,120,0,-9,-90,-200};
        integer c;
        for(integer i=1;i<=nums.size();i++)
        {
            for(integer j=0;j<=nums.size()-2;j++)
            {
                if(nums[j]>nums[j+1])
                {
                    c=nums[j];
                    nums[j]=nums[j+1];
                    nums[j+1]=c;
                }
            }
        } 
        nums1.sort();
        System.debug(nums);
        System.debug(nums1);
    }
    public void pairsfinder(){
        Set<Integer> numsSet = this.randomInRange();
        System.debug(numsSet.size());
        integer [] nums=new integer[]{};
        for (integer var : numsSet)
        {
            nums.add(var);
        }
         System.debug(nums.size());
        integer targetdiff=5;
        integer count=0;
        for(integer i=0;i<nums.size();i++)
        {
            for(integer j=i;j<nums.size();j++)
            {
                if((nums[j]-nums[i])==targetdiff||(nums[i]-nums[j])==targetdiff)
                {
                    count+=1;
                }
            }
        }
        System.debug(count); 
    }
    public set<integer> random(){
		Set<Integer> nums = new Set<Integer>();
        while(nums.size()<1000)
        {
            nums.add((Integer.valueOf((Math.random() * 10000))));
        }
        System.debug(nums);
        return nums;
    }
    
    public set<integer> randomInRange()
    {
        integer low=1000,high=10000,requiredSize=1000;
        return randomInRange(low, high, requiredSize);
    }
    
    public set<integer> randomInRange(Integer low, Integer high, Integer requiredSize)
    {
        Set<Integer> nums = new Set<Integer>();
        //Set<Integer> nums1 = new Set<Integer>();
        integer b;
        while(nums.size()<requiredSize)
        {
            b=Integer.valueOf(Math.random()*10000);
            if(b>low && b<high)
                nums.add(b);
        }
        //system.debug('The result is'+nums);
        return nums;
    }
    public void findRange(integer minRange, integer maxRange,
                          integer requiredNumbersInRange, integer range)
    {
        Set<Integer> numsSet = this.randomInRange(minRange, maxRange, 
                                                  requiredNumbersInRange);
        list<integer> numsRangeList= new list<integer>();
        integer countRange=0;
        integer numRange = 0;
        countRange=(maxRange-minRange)/range;
		for(integer i=0;i<countRange;i+=1)
        {
            numsRangeList.add(0);
        }
        for(integer num: numsSet)
        {
            numRange = (Integer) ((num-minRange) / range);
            numsRangeList[numRange] ++;
        }
        System.debug(numsRangeList);
    }
  /*  public void findRangeUsingMap(integer minRange, integer maxRange,
                          integer requiredNumbersInRange, integer range)
    {
        Set<Integer> numsSet1 = this.randomInRange(minRange, maxRange, 
                                                  requiredNumbersInRange);
        Map<Integer, Integer> m = new Map<Integer,Integer>(); 
        integer countRange=0;
        integer numRange =0;
        countRange=(maxRange-minRange)/range;
		for(integer i=0;i<countRange;i+=1)
        {
            m.put(i,0);
        }
        integer i=0;
        for(integer num: numsSet1)
        {
            numRange =(Integer)((num-minRange) / range);
            i+=1;
            m.put(numRange,);
        }
        
        System.debug(m);
    }
	*/
    public void range(integer minRange, integer maxRange,
                          integer requiredNumbersInRange, integer range)
    {
        if((maxRange-minRange)<requiredNumbersInRange)
        {
            System.debug('Sorry not possible I am exiting');
            return;
        }
        else if((minRange==maxRange)&&((maxRange-minRange)<requiredNumbersInRange))
        {
            System.debug(maxRange);
        }
        else if(maxRange-minRange<range)
        {
            range=maxRange-minRange;
        }
        else if(minRange>maxRange)
        {
            System.debug('Minimum value is greater than Maximum value Exiting Bye');
            return;
        }
        else if(minRange==maxRange)
        {
            System.debug(minRange);
        }
        else
        {
            Set<Integer> numsSet1 = this.randomInRange(minRange, maxRange, 
                                                  requiredNumbersInRange);
        Map<string, Integer> m = new Map<string,Integer>();
        Map<string, set<Integer>> numberRangeSetMap = new Map<string,set<Integer>>();
        for(integer num:numsSet1)
        {
            //System.debug(num);
            //Identify the map key for each record.
            //157->"151-200".
            integer mod=(Math.mod(num, range));
            //System.debug((num-minRange)/range);
            integer low,high;
            low=num-mod;
            high=low+range;
            integer result1,result2;
            result1=low+1;
            result2=high;
            string key;
            set<integer>rangeset;
            if(low==minRange)
            {
                key=string.valueOf(low) + '-' + string.valueOf(high);
            }
            else
                key=string.valueOf(low+1) + '-' + string.valueOf(high);
            //System.debug(key);
            m.put(key,1);
            integer valuekey=m.get(key);
            //I am Checking if the value is present in our map for the particular key or not, if the key is available we will update the value by 1.
            if(valuekey==NULL)
            {
                valuekey=1;
			}
            else
            {
                valuekey+=1;
            }
            m.put(key,valuekey);
            rangeset=numberRangeSetMap.get(key);
            if(rangeset!=NULL)
            {
                rangeset.add(num);
            }
            else
            {
                rangeset=new set<integer>();
                rangeset.add(num);
            }
            numberRangeSetMap.put(key,rangeset);
        }
        System.debug(m);
        System.debug(numberRangeSetMap);
   		}
    }
}