import { LightningElement,api, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import updateCaseStatus from '@salesforce/apex/CaseStatusCount.updateCaseStatus';
import { getRecord } from 'lightning/uiRecordApi';
import CASE_OBJECT from '@salesforce/schema/Case';
export default class ChildComponentStatusInline extends LightningElement {
    @api accountId;
    cases = [];
    wiredCasesResult;
  
    @wire(getRecord, {
      recordId: '$accountId',
      fields: [CASE_OBJECT]
    })
    wiredAccount({ error, data }) {
      if (data) {
        this.accountId = data.id;
      } else if (error) {
        console.error(error);
      }
    }
  
    handleStatusSelected(status) {
      getCases({ accountId: this.accountId, status })
        .then((result) => {
          this.cases = result;
        })
        .catch((error) => {
          console.error(error);
        });
    }
  
    handleStatusChange(event) {
      const caseId = event.target.dataset.caseId;
      const currentStatus = event.target.dataset.currentStatus;
      const newStatus = event.target.value;
  
      if (currentStatus != newStatus) {
        updateCaseStatus({ caseId:caseId, newStatus:newStatus })
          .then((result) => {
            if(result == 'Success')
            {
            showToast('success', 'Case Status Updated', 'The case status has been updated successfully.');
            return refreshApex(this.wiredCasesResult);
            }
          })
          .catch((error) => {
            showToast('error', 'Error Updating Case Status', 'An error occurred while updating the case status.');
            console.error(error);
          });
        }
}
}