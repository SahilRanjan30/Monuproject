import { LightningElement } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityDataUsingSet.getOpportunity';
import { CloseActionScreenEvent } from 'lightning/actions'; 
const columns = [
    { label: 'Id', fieldName: 'Id'},
    { label: 'Name', fieldName: 'Name'},
    { label: 'StageName', fieldName: 'StageName'},
    { label: 'Type', fieldName: 'Type'},
];

export default class OpportunityDataSet extends LightningElement {

    data = [];
    columns = columns;

    connectedCallback() {
        getOpportunity()
        .then(result => {
                /*for(var myval in result)
                {
                    mySet.add(myval);
                }
                */
                //mySet.add(1);
                console.log('Printing'+JSON.parse(result));
                const mySet = new Set(result);
                console.log('Set data'+mySet);
                //mySet.add(result);
                /*for (const key in mySet) {
                    this.data= key;   
                }
                */
               //this.data=mySet;
               this.data=result;
                //console.log('Result'+JSON.stringify(mySet));
            })
        .catch(error => {
                console.log(error);
                this.showCustomNotice('Error', reduceErrors(error), 'error');
            });
    }

    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}