public without sharing class updateLead {
    @future(callout = true)
    //Method is used for Calculating the Lead Score based on the conditions.
    public static void futureMethod(List<Id> leadId){
        //In this list we are querying the mandatory fields which is required for calculating the scores.
        List<Lead> leadList = [Select Id,LeadSource,Diab__c,Proximity_Score__c,Insurance_Score__c,HCP_Score__c,Overall_Score__c,Therapy_Score__c,
        Status,Payor_Tier__c,Payor__c,PostalCode From Lead WHERE Id IN :leadId];
        List<Contact> hcpList = [Select MailingPostalCode FROM Contact WHERE Prescribing_and__c =:'Prescribing and Placing'];
        //This list contains the updated values which we calculate and update.
        List<Lead>  leadUpdateList = new List<Lead>();
        //This list contain the zip code of every lead which are getting created.
        List<String> zipCodeList = new List<String>();
        for(Contact hcpContact:hcpList){
            zipCodeList.add(String.valueOf(hcpContact.MailingPostalCode));
        }
        try{
            //This for loop is used for checking the condition, based on the condition Score's are getting calculated.
            for(Lead eachLead:leadList){
            if(eachLead.LeadSource=='Website'){
                if(eachLead.Diab__c=='Type 2- Non-insulin Required'){
                eachLead.Insurance_Score__c = 0.00;
                eachLead.HCP_Score__c = 0.00;
                eachLead.Therapy_Score__c = 0.00; 
                eachLead.Proximity_Score__c=0.00;
                eachLead.Status = 'Lead Cancelled';
                eachLead.Overall_Score__c = (eachLead.HCP_Score__c+ eachLead.Insurance_Score__c+eachLead.Therapy_Score__c + eachLead.Proximity_Score__c);
                }

                if(eachLead.Diab__c =='Type 2 -Insulin Required'||eachLead.Diab__c =='Type 1'){
                    if(eachLead.Payor_Tier__c== '1'){
                        eachLead.Insurance_Score__c = 200.00;
                    }
                    if(eachLead.Payor_Tier__c == '2'){
                        eachLead.Insurance_Score__c = 100.00;
                    }
                    if(eachLead.Payor_Tier__c == '3'){
                        eachLead.Insurance_Score__c = 10.00;
                    }
                    if(eachLead.Payor_Tier__c == '4'){
                        eachLead.Insurance_Score__c = 0.00;
                    }
                    System.debug('Insurance score ' + eachLead.Insurance_Score__c);
                    //Here we are getting the smallest distance by calling the function.
                    Decimal smallestDistance=externalApiCall(eachLead,zipCodeList);
                    if(smallestDistance == 0.00)
                    {
                        eachLead.Proximity_Score__c = 50.00;
                    }
                    else if(smallestDistance <= 60.00){
                        eachLead.Proximity_Score__c =50.00;
                    }
                    else if(smallestDistance > 60.00 && smallestDistance<=120.00) {
                        eachLead.Proximity_Score__c =25.00;
                    }
                    else {
                        eachLead.Proximity_Score__c =-80.00;
                    }
                    eachLead.Therapy_Score__c = 100.00;
                    eachLead.HCP_Score__c = 0.00;
                    //if (eachLead.Insurance_Score__c != NULL && eachLead.Therapy_Score__c != NULL && eachLead.HCP_Score__c != NULL && eachLead.Proximity_Score__c != NULL) {
                        eachLead.Overall_Score__c = (eachLead.Insurance_Score__c + eachLead.Therapy_Score__c + eachLead.HCP_Score__c + eachLead.Proximity_Score__c);   
                   // }
                }
            }
        if(eachLead.LeadSource=='HCP Lead'){
            if(eachLead.Diab__c=='Type 2- Non-insulin Required'){
                eachLead.Proximity_Score__c = 0.00;
                eachLead.Insurance_Score__c = 0.00;
                eachLead.HCP_Score__c = 0.00;
                eachLead.Therapy_Score__c = 0.00;
                eachLead.Status = 'Lead Cancelled';
            }
            if(eachLead.Diab__c=='Type 2 -Insulin required'|| eachLead.Diab__c=='Type 1'){
                eachLead.Therapy_Score__c = 100.00;
                eachLead.Insurance_Score__c = 200.00;
                eachLead.HCP_Score__c = 150.00;
                eachLead.Proximity_Score__c = 50.00;
            }
            //if (eachLead.Insurance_Score__c != NULL && eachLead.Therapy_Score__c != NULL && eachLead.HCP_Score__c != NULL && eachLead.Proximity_Score__c != NULL) {
                eachLead.Overall_Score__c = (eachLead.Insurance_Score__c + eachLead.Therapy_Score__c + eachLead.HCP_Score__c + eachLead.Proximity_Score__c);   
            //}
        }
        leadUpdateList.add(eachLead);
        System.debug('Update List '+leadUpdateList);
    }
        update leadUpdateList;
}
        catch( System.Exception e) {
             System.debug('ERROR: '+ e.getLineNumber()+e.getMessage());
        }
    }
    // In this function we are making a external callout for calculating the distance of every lead.
    public static Decimal externalApiCall(Lead listLead,List<String> hcpzipcodelist){
        Decimal smallestDistance = 0.00;
        Decimal newDistance;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:ZIPCODEAPI/DemoOnly004d7Sr4HSQDu3hVbGFYH2UEB4L0VoQi7JyOyxHxNxzB2kYhQVCfuWlb/radius.json/'+listLead.PostalCode+'/120/mile');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
           Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> reslist = (List<Object>) results.get('zip_codes');
           // List<Decimal> DistanceList = new List<Decimal>();
                 for(Object zipcode:reslist){
                    Map<String,Object> mapzipcode = (Map<String,Object>) zipcode;
                    String stringzipcode = (String) mapzipcode.get('zip_code');
                    if(hcpzipcodelist.contains(stringzipcode)){
                        system.debug('zp : '+stringzipcode);
                    newDistance=(Decimal) mapzipcode.get('distance');
                    if((newDistance < smallestDistance) || (smallestDistance == 0.00)){
                          smallestDistance = newDistance;
                        }  
                       // DistanceList.add(newDistance);
                     }
               }
            }
            return smallestDistance;
        }
    // This function will receive list of newly inserted Lead from Trigger.
    public static void getLeadScore(List<Lead> newLeads){
       List<Id> leadId = new List<Id>();
        for(Lead leadList: newLeads){
            leadId.add(leadList.Id);
        }
        futureMethod(leadId);
    }
}
