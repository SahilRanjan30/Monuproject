import { LightningElement,api } from 'lwc';
import getCaseCounts from '@salesforce/apex/CaseStatusCount.getCaseCounts';
const columns = [
    { label: 'Account Id', fieldName: 'AccountId'},
    { label: 'Status', fieldName: 'Status',editable: true },
    { label: 'Case Origin', fieldName: 'Origin' },
    { label: 'Subject', fieldName: 'Subject' },
];
export default class AccountCaseParent extends LightningElement {
    @api recordId;
    allCasesList=[];
    datatablelist = [];
    accName;
    caseCount=0;
    showTable=false;
    dataOpenStatus = [];
    dataClosedStatus = [];
    dataInProgressStatus = [];
    dataEscalatedStatus = [];
    columns = columns;
    draftValues = [];
    updatedRecord = [];
    accName;
    openCaseCount=0;
    closeCaseCount=0;
    inProgressCaseCount=0;
    EscalatedCaseCount=0;    
    connectedCallback() {
        setTimeout(() => {
            this.fetchRecords();
        }, 5);
    }
    fetchRecords(){
        getCaseCounts({ AccountId: this.recordId })
            .then(result => {
                console.log(JSON.stringify(result));
                this.dataOpenStatus = result.CaseMap.Open;
                this.dataClosedStatus = result.CaseMap.Closed;
                this.dataInProgressStatus = result.CaseMap.InProgress;
                this.dataEscalatedStatus = result.CaseMap.Escalated;
                this.accName = result.AccountName;
                this.caseCount = result.CaseMap.Open.length + result.CaseMap.Closed.length + result.CaseMap.InProgress.length + result.CaseMap.Escalated.length;
                this.openCaseCount = result.CaseMap.Open.length;
                this.closeCaseCount = result.CaseMap.Closed.length;
                this.inProgressCaseCount = result.CaseMap.InProgress.length;
                this.EscalatedCaseCount = result.CaseMap.Escalated.length;
            })
            .catch(error => {
                this.error = error;
                console.log('Error' + this.error);
            });
    }
    handleClick(event) {
        let x = event.target.dataset.id;
        if(x == 'Open'){
            this.showTable = true;
            this.datatablelist = this.dataOpenStatus;
        }

        else if(x == 'Closed'){
            this.showTable = true;
            this.datatablelist = this.dataClosedStatus;
        }
        else if(x == 'Escalated'){
            this.showTable = true;
            this.datatablelist = this.dataEscalatedStatus;
        }
        else
        {
            this.showTable = true;
            this.datatablelist = this.dataInProgressStatus;
        }
    }
}