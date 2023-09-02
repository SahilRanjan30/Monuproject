public with sharing class passOpportunityData {
    @AuraEnabled
    public static Map<Id,Opportunity> queryOpportunityData()
    {
        //List<Opportunity> opplst = new List<Opportunity>(); 
        //opplst = [Select Id, Name, StageName, Type from Opportunity LIMIT 10];
        //return opplst;
        Map<Id, Opportunity> OpportunityMap = new Map<Id, Opportunity>([Select Id, Name, StageName, Type from Opportunity LIMIT 60]);
        return OpportunityMap;
    }
    @AuraEnabled
    public static void printOpportunityData(String OpportunityId)
    {
        System.debug(OpportunityId);
        string optId;
        List<Opportunity> jsonOpportunityList = (List<Opportunity>) JSON.deserialize(OpportunityId, List<Opportunity>.class);
        Map<Id,Opportunity> mp = new Map<Id,Opportunity>();
        for (Opportunity opts : jsonOpportunityList) {
            mp.put(opts.Id, opts);
            //Id= opts.Id;
            optId = opts.Id;
        }
        /*for (Opportunity opts : mp) {
            System.debug(op, o);
        }
        */
        List<Opportunity> lstFromMap = new List<Opportunity>();
        for (String myMap : mp.keySet()) {
            lstFromMap.add(mp.get(myMap));
        }
        List<Opportunity> mapLst = mp.values();
        System.debug(mapLst);
        //System.debug(mp.values());
       // System.debug(mp.get(optId));
        System.debug(lstFromMap);
    }
}