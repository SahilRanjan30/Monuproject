public with sharing class LeadControllerExtension {

    private ApexPages.StandardController standardController;
    
    public LeadControllerExtension(ApexPages.StandardController controller) {
        this.standardController = controller;
    }

    public PageReference convertLead() {
        Lead leadRecord = (Lead)standardController.getRecord();
        LeadConverter.convertLeadToAccountAndOpportunity(leadRecord.Id);
        return null;
    }
}
