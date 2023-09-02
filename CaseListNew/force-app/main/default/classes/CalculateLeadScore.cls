public with sharing class CalculateLeadScore {
    @future(callout = true)
    public static void futureMethod(List<Id> leadId){
        System.debug('I am futureMethod'+ leadId);
        List<Lead> leadList = [Select Id,Diab__c,Proximity_Score__c,Insurance_Score__c,HCP_Score__c,Overall_Score__c,Therapy_Score__c,LeadSource,
        Status,Payor_Tier__c,Payor__c From Lead WHERE Id IN :leadId];
        List<Contact> hcpList = [Select MailingPostalCode FROM Contact];
        List<Lead>  leadUpdateList = new List<Lead>();
        List<String> zipCodeList = new List<String>();
        for(Contact hcpContact:hcpList){
            zipCodeList.add(String.valueOf(hcpContact.MailingPostalCode));
        }
        try{
            for(Lead eachLead:leadList){
            if(eachLead.LeadSource=='Website'){
                if(eachLead.Diab__c=='Type 2-Non-Insulin Required'&& (eachLead.Payor__r==NULL)){
                eachLead.Insurance_Score__c = 0;
                eachLead.HCP_Score__c = 0;
                eachLead.Therapy_Score__c = 0;
                eachLead.Proximity_Score__c=0;
                eachLead.Status = 'Lead Cancelled';
                eachLead.Overall_Score__c = (eachLead.HCP_Score__c+ eachLead.Insurance_Score__c+eachLead.Therapy_Score__c + eachLead.Proximity_Score__c);
                }
                if(eachLead.Diab__c =='Type 2-Insulin Required'||eachLead.Diab__c =='Type 1'){
                    if(eachLead.Payor_Tier__c== '1'){
                        eachLead.Insurance_Score__c = 200;
                    }
                    if(eachLead.Payor_Tier__c == '2'){
                        eachLead.Insurance_Score__c = 100;
                    }
                    if(eachLead.Payor_Tier__c == '3'){
                        eachLead.Insurance_Score__c = 10;
                    }
                    if(eachLead.Payor_Tier__c == '4'){
                        eachLead.Insurance_Score__c = 0;
                    }
                    Decimal smallestDistance=externalApiCall(eachLead,zipCodeList);
                    if(smallestDistance == 0||smallestDistance <= 60.00){
                        eachLead.Proximity_Score__c =50;
                    }
                    else if(smallestDistance > 60.00 && smallestDistance<=120.00) {
                        eachLead.Proximity_Score__c =25;
                    }
                    else if(smallestDistance > 120.00){
                        eachLead.Proximity_Score__c =-85;
                    }
                    eachLead.Therapy_Score__c = 100;
                    eachLead.HCP_Score__c = 0;
                    eachLead.Overall_Score__c = (eachLead.Insurance_Score__c + eachLead.Therapy_Score__c + eachLead.HCP_Score__c + eachLead.Proximity_Score__c);
                }
            }
        if(eachLead.LeadSource=='HCP Lead'){
            if(eachLead.Diab__c=='Type 2-Non-Insulin Required'){
                eachLead.Overall_Score__c = (eachLead.HCP_Score__c+ eachLead.Insurance_Score__c+eachLead.Therapy_Score__c + eachLead.Proximity_Score__c);
                eachLead.Proximity_Score__c = 0;
                eachLead.Insurance_Score__c = 0;
                eachLead.HCP_Score__c = 0;
                eachLead.Therapy_Score__c = 0;
                eachLead.Status = 'Lead Cancelled';
            }
            if(eachLead.Diab__c=='Type 2-Insulin Required'|| eachLead.Diab__c=='Type 1'){
                eachLead.Therapy_Score__c = 100;
                eachLead.Insurance_Score__c = 200;
                eachLead.HCP_Score__c = 150;
                eachLead.Proximity_Score__c = 50;
            }
            eachLead.Overall_Score__c = (eachLead.Insurance_Score__c + eachLead.Therapy_Score__c + eachLead.HCP_Score__c + eachLead.Proximity_Score__c);
        }
        leadUpdateList.add(eachLead);
    }
    update  leadUpdateList;
}
        catch( System.Exception e) {
             System.debug('ERROR: '+ e);
        }
    }
    public static Decimal externalApiCall(Lead listLead,List<String> hcpzipcodelist){
        Decimal smallestDistance = 0.00;
        Decimal newDistance = 0.00;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //sending url with lead url zipcode
        request.setEndpoint('https://www.zipcodeapi.com/rest/DemoOnly00jkb82JpTn2HZrdXYNHjcbD5zcYECRZEiy0iBc2l5rbiUVvb2CtFgQI/radius.json/77478/120/mile');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
           Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> reslist = (List<Object>) results.get('zip_codes');
            System.debug('Received the following zip_codes:');
                System.debug(reslist);
                 for(Object zipcode:reslist){
                    Map<String,Object> mapzipcode = (Map<String,Object>) zipcode;
                    String str = String.valueOf(mapzipcode);
                   if(hcpzipcodelist.contains(str)){
                    newDistance=(Decimal) mapzipcode.get('distance');
                    if(newDistance<smallestDistance||smallestDistance==0){
                          smallestDistance = newDistance;
                   }
                    }
               }
            }
            return smallestDistance;
        }
        
    public static void getLeadScore(List<Lead> newLeads){
       List<Id> leadId = new List<Id>();
        for(Lead leadList: newLeads){
                leadId.add(leadList.Id);
                System.debug('I am Lead Id getscore'+ leadId);
                //System.debug('Lead Fields', ld);
        }
        futureMethod(leadId);
    }
}