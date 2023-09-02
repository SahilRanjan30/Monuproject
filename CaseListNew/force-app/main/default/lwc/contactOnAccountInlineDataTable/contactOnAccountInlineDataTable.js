import { LightningElement, api } from 'lwc';
import contactData from '@salesforce/apex/FetchContactData.contactData';
import { CloseActionScreenEvent } from 'lightning/actions';
import updateContact from '@salesforce/apex/FetchContactData.updateContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const columns = [
    { label: 'Name', fieldName: 'Name'},
    { label: 'Email', fieldName: 'Email',editable: true },
    { label: 'Phone', fieldName: 'Phone',editable: true },
];

export default class ContactOnAccountInlineDataTable extends LightningElement {
    @api recordId;
    data = [];
    columns = columns;
    draftValues = [];
    updatedRecord = [];
    connectedCallback() {
        setTimeout(() => {
            this.CallingApex();
        }, 5);
    }

    CallingApex() {
        console.log('recId='+this.recordId);
        contactData({ recId: this.recordId })
            .then(result => {
                console.log('Updated Record is :'+this.updatedRecord);
                console.log(JSON.stringify(result));
                this.data = result;
            })
            .catch(error => {
                console.log(error);
                this.showCustomNotice('Error', reduceErrors(error), 'error');
            });
    }

    handleSave(event){
        console.log(JSON.stringify(event.target.draftValues));
        updateContact({conLst :event.target.draftValues})
        .then(result => {
            if(result == true)
            {
                const evt = new ShowToastEvent({
                    title: 'Contact Updated',
                    variant: 'success',
                });
                this.dispatchEvent(evt);
                console.log(' Record Updated ');
                console.log(JSON.stringify(result));
                this.data = result;
                this.handleCancel();
            }
            else{
                const evt = new ShowToastEvent({
                    title: 'Contact Updation Failed',
                    variant: 'error',
                });
                this.dispatchEvent(evt);
            }
            
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