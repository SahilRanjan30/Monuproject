import { LightningElement, api } from 'lwc';
import getdetails from '@salesforce/apex/accountContactList.getdetails';
import { CloseActionScreenEvent } from 'lightning/actions';
export default class AccountContact extends LightningElement {
    @api recordId;
    accountId;
    data = [];
    contactData = [];
    connectedCallback() {
        setTimeout(() => {
            this.fetchRecords();
        }, 5);
    }

    fetchRecords() {
        getdetails({ recId: this.recordId })
            .then(result => {
                this.data = result[0];
                this.contactData = this.data.Contacts;
                console.log('ResultFor Contact' + JSON.stringify(this.contactData));
            })
            .catch(error => {
                this.error = error;
                console.log('Error' + this.error)
            });
    }   

    handleCancel()
    {
        this.dispatchEvent(new CloseActionScreenEvent());
        const closeParentCmp = new CustomEvent('closeCmp');
        // Fire the custom event
        this.dispatchEvent(closeParentCmp);
    }

}