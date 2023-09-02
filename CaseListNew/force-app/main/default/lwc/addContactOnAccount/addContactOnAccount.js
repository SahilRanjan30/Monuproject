import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
import Phone from '@salesforce/schema/Contact.Phone';
import AccountId from '@salesforce/schema/Contact.AccountId';
import Contact from '@salesforce/schema/Contact';
export default class AddContactOnAccount extends LightningElement {
    @api recordId;
    objectApiName = Contact;
    result=[FirstName,LastName,Email,Phone,AccountId];
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Account created',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
}