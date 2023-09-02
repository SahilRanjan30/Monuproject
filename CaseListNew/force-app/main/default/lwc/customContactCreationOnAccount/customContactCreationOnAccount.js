import { LightningElement, api } from 'lwc';
import createNewContact from '@salesforce/apex/ContactData.createNewContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
export default class CustomContactCreationOnAccount extends LightningElement {
    textValue;
    loaded = true;
    @api recordId;
    handleFirstName(event) {
        this.FirstName = event.detail.value;
        console.log(this.FirstName);
    }

    handleLastName(event) {
        this.LastName = event.detail.value;
        console.log(this.LastName);
    }

    handleEmail(event) {
        this.Email = event.detail.value;
        console.log(this.Email);
    }

    handlePhoneNumber(event) {
        this.Phone = event.detail.value;
        console.log(this.Phone);
    }

    handleSave() {
        createNewContact({ Fname: this.FirstName, Lname: this.LastName, Email: this.Email, Phone: this.Phone, AccountId: this.recordId })
            .then(result => {

                if (result != null) {
                    this.data = result;
                    this.loaded = !this.loaded;
                    console.log(JSON.stringify(this.data));
                    this.showToastSuccess();
                    this.handleCancel();
                }
                else {
                    this.showToastError();
                    this.loaded = true;
                }

            })
            .catch(error => {
                this.error = error;
                console.log('Error' + this.error);
                this.showToastError();
                this.loaded = true;
            });
    }
    showToastSuccess() {
        const event = new ShowToastEvent({
            title: 'Contact created',
            message: 'New Contact Created',
            variant: 'success',
        });
        this.dispatchEvent(event);
    }
    showToastError() {
        const event = new ShowToastEvent({
            title: 'ERROR',
            message: 'Please fill the required fields',
            variant: 'error',
        });
        this.dispatchEvent(event);
    }
    handleCancel() {
        console.log('I am here');
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}