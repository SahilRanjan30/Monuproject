public with sharing class TabSetOnAccountOpportunityCase {
    public class ApprovalRecordWrapper {
        @AuraEnabled  public Decimal Amount;
        @AuraEnabled  public string AccountId;
        @AuraEnabled  public string OpportunityId;
        @AuraEnabled  public string CaseId;
        @AuraEnabled  public String type;
        @AuraEnabled  public String stage;
        @AuraEnabled  public String oppStatus;
        @AuraEnabled  public String oppStep;
        @AuraEnabled  public String Name;
        @AuraEnabled  public String billingcity;
        @AuraEnabled  public String email;
        @AuraEnabled  public String accStep;
        @AuraEnabled  public String accStatus;
        @AuraEnabled  public String subject;
        @AuraEnabled  public String Owner;
        @AuraEnabled  public String accName;
        @AuraEnabled  public String cseStep;
        @AuraEnabled  public String cseStatus;  
        @AuraEnabled  public String oppurl; 
        @AuraEnabled  public String accurl;
        @AuraEnabled  public String cseurl;  
     }
  
    
     @AuraEnabled
     public static Map<string,List<ApprovalRecordWrapper>> getApprovalRecord() {
               List<Id> instanceIdList = new List<Id>();
               Map<string,List<ApprovalRecordWrapper>> genMap = new Map<string,List<ApprovalRecordWrapper>>();
               Map<Id,ProcessInstance> lcmap = new Map <Id,ProcessInstance>();
               List<ProcessInstance> instLst = [SELECT Status, TargetObjectId,(Select StepStatus, ProcessNode.Name FROM StepsAndWorkitems WHERE StepStatus = 'pending') FROM ProcessInstance WHERE Status = 'pending'];
               for(processInstance pslst:instLst ){
                  instanceIdList.add(pslst.TargetObjectId);
                  lcmap.put(pslst.TargetObjectId,pslst);
               }
               List<ApprovalRecordWrapper> oppList = new List<ApprovalRecordWrapper>();
               List<Opportunity> oppLst = [SELECT Id, StageName,Amount,Type FROM Opportunity WHERE Id =:instanceIdList];
               for(Opportunity opp : oppLst){
                  ApprovalRecordWrapper approvalRecords = new ApprovalRecordWrapper();
                  approvalRecords.OpportunityId = opp.Id;
                  approvalRecords.oppurl = '/' + opp.Id;
                  approvalRecords.Amount = opp.Amount;
                  approvalRecords.stage = opp.StageName;
                  approvalRecords.type = opp.Type;
                  approvalRecords.oppStatus = lcmap.get(opp.Id).Status;
                  approvalRecords.oppStep = lcmap.get(opp.Id).StepsAndWorkitems[0].ProcessNode.Name;
                  oppList.add(approvalRecords);
                  System.debug(approvalRecords.OpportunityId);
               }
               genMap.put('Opportunity',oppList);

            List<ApprovalRecordWrapper> accList = new List<ApprovalRecordWrapper>();
            List<Account> accLst = [SELECT Id,Name,PersonEmail,BillingCity FROM Account WHERE Id =:instanceIdList];   
            for(Account acc : accLst){
               ApprovalRecordWrapper accObj = new ApprovalRecordWrapper();
               accObj.AccountId = acc.Id;
               accObj.accurl = '/' + acc.Id;
               accObj.Name = acc.Name;
               accObj.email = acc.PersonEmail;
               accObj.billingcity = acc.BillingCity;
               accObj.accStatus = lcmap.get(acc.Id).Status;
               accObj.accStep = lcmap.get(acc.Id).StepsAndWorkitems[0].ProcessNode.Name;
               accList.add(accObj);
            }
            genMap.put('Account', accList);

            List<ApprovalRecordWrapper> caseList = new List<ApprovalRecordWrapper>();
            List<Case> csLst = [SELECT Id, Subject, Account.Name, Owner.Name FROM Case WHERE Id =:instanceIdList];
            for (Case css : csLst) {
               ApprovalRecordWrapper cseObj = new ApprovalRecordWrapper();
               cseObj.CaseId = css.Id;
               cseObj.cseurl = '/'+ css.Id;
               cseObj.subject = css.Subject;
               cseObj.Name = css.Account.Name;
               cseObj.Owner = css.Owner.Name;
               cseObj.cseStatus = lcmap.get(css.Id).Status;
               cseObj.cseStep = lcmap.get(css.Id).StepsAndWorkitems[0].ProcessNode.Name;
               caseList.add(cseObj);
            }
            genMap.put('Case',caseList);
            return genMap;
         }
      }