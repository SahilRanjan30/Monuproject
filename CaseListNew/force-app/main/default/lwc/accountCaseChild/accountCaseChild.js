import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { updateRecord } from 'lightning/uiRecordApi';
export default class AccountCaseChild extends LightningElement {
    @api objlist=[];
    @api recordId;
    skip=0;
    objColumns = [
        { label: 'Account Id', fieldName: 'AccountId'},
        { label: 'Status', fieldName: 'Status',editable: true },
        { label: 'Case Origin', fieldName: 'Origin' },
        { label: 'Subject', fieldName: 'Subject' },
    ];

    async handleSave(event) {
        const records = event.detail.draftValues.slice().map((draftValue) => {
            const fields = Object.assign({}, draftValue);
            return { fields };
        });
            for (const key in records) {
                if(records[key].fields.Status == 'Open')
                    this.skip = 1;
                if(records[key].fields.Status == 'Closed')
                    this.skip = 1;
                if(records[key].fields.Status == 'In Progress')
                    this.skip = 1;
                if(records[key].fields.Status == 'Escalated')
                    this.skip = 1;
            }
            if(this.skip == 1){
            const recordUpdatePromises = records.map((records) =>
                updateRecord(records)
            );
            await Promise.all(recordUpdatePromises);    
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',   
                    message: 'Case Status updated',
                    variant: 'success'
                })
            );
                window.location.reload(true);
            }
            else{
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Failed',   
                        message: 'Invalid Picklist value',
                        variant: 'error'
                    })
                );
            }
        }
}
