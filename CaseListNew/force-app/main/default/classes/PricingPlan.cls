public with sharing class PricingPlan {
  @AuraEnabled
   public static void updatePricingPlan(string result,Date value,string id)
    {
          list<Account> acc = [SELECT id,Effective_Date__c,Pricing_Plan__c FROM Account WHERE id =: id];
          acc[0].Effective_Date__c = value;
          acc[0].Pricing_Plan__c = result;
          if(acc.size()>0)
            update acc;
    }
  @AuraEnabled
  public static List<Pricing_Plan__c> getPricingPlanLst(){
    try {
        List<Pricing_Plan__c> prplLst = [SELECT Name,Is_Active__c from  Pricing_Plan__c Where Is_Active__c=True];
        return prplLst;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
  }

  @AuraEnabled
  public static List<Account> effectiveDate(Id recId){
    try {
      List<Account> accLst = [SELECT Unpaid_Session__c FROM Account WHERE Id=:recId];
      return accLst;
    
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  } 

  @AuraEnabled
  public static String createRecord(Id pricingPlanId, Date effectiveDate){
    try {
      Account_Pricing_Plan__c accPrcPln = new Account_Pricing_Plan__c();  
      accPrcPln.Pricing_Plans__c = pricingPlanId; 
      accPrcPln.Name = 'New Pricing Plan';
      accPrcPln.Effective_Date__c = effectiveDate;
      insert accPrcPln;
      System.debug('Price plan '+accPrcPln);
      return 'Success';
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}