import { LightningElement, api, wire } from 'lwc';
//import getrelatedAccountData from '@salesforce/apex/accountParentChildWrapper.getrelatedAccountData';
import {getRelatedListCount} from 'lightning/uiRelatedListApi';
import { CloseActionScreenEvent } from 'lightning/actions';

export default class AccountParentChild extends LightningElement {
    @api recordId;
    //@track data = [];
    //@track error;
    opportunityCount=0;
    contactCount=0;
    taskCount=0;
    casesCount=0;
    /*@wire(getrelatedAccountData, {recId: 'recordId'})
    
     wiredData(result) {
        if (result) {
            this.opportunityCount = result.opportunityCount;
            this.contactCount = result.contactCount;
            this.casesCount = result.casesCount;
            this.taskCount = result.taskCount;  
            console.log(this.opportunityCount);
        }
    }

    */
   // connectedCallback() {
        //console.log('Executed callback');
        /*setTimeout(() => {

            //this.fetchRecords();
        }, 5);
        */
   // }
    /*
    fetchRecords() {
        console.log('recId' + this.recordId);
        getrelatedAccountData({ recId: this.recordId })
            .then(result => {
                this.opportunityCount = result.opportunityCount;
                this.contactCount = result.contactCount;
                this.casesCount = result.casesCount;
                this.taskCount = result.taskCount;
            })
            .catch(error => {
                this.error = error;
            })
    }
    */
    
   
    @wire(getRelatedListCount, {
        parentRecordId: "$recordId",
        relatedListId: "Opportunities"
    })
    const({ error, data }) {
        if (data) {
            this.opportunityCount = data.count;
            console.log('result------' + JSON.stringify(this.opportunityCount));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.oppData = undefined;
        }
    }
    @wire(getRelatedListCount, {
        parentRecordId: "$recordId",
        relatedListId: "Contacts"
    })
    const1({ error, data }) {
        if (data) {
            this.contactCount = data.count;
            console.log('result------' + JSON.stringify(this.contactCount));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.conData = undefined;
        }
    }
    @wire(getRelatedListCount, {
        parentRecordId: "$recordId",
        relatedListId: "Cases"
    })
    const3({ error, data }) {
        if (data) {
            this.casesCount = data.count;
            console.log('result------' + JSON.stringify(this.casesCount));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.caseData = undefined;
        }
    }

    /*@wire(getRelatedListCount, {
        parentRecordId: "$recordId",
        relatedListId: "tasks"
    })
    tasksconst({ error, data }) {
        if (data) {
            this.taskCount = data.count;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.opportunityCount = undefined;
        }
    }*/
    
    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}