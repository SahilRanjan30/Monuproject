import { LightningElement,api,wire } from 'lwc';
import getCaseCounts from '@salesforce/apex/CaseStatusCount.getCaseCounts';
export default class ParentChildStatusInlineEdit extends LightningElement {
    caseCounts = [];
    @api recordId;
    openCases=0;
    closedCases=0;
    inProgressCases=0;
    totalCases=0;
    connectedCallback() {
        getCaseCounts({AccountId : this.recordId})
        .then((result) =>{
           console.log(result.Open);
           console.log(result.Closed);
           console.log(result.InProgress);
           this.openCases = result.Open;
           this.closedCases = result.Closed;
           this.inProgressCases = result.InProgress;
           this.totalCases = this.openCases + this.closedCases + this.inProgressCases;
           console.log(this.totalCases);
        })       
        .catch(error => {
            this.error = error;
            console.log('Error' + this.error);
        });
    }  
    handleStatusClick(event) {
      const status = event.target.dataset.status;
      fireEvent(this.pageRef, 'statusselected', status);
    }
}