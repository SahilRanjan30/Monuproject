import { LightningElement, api } from 'lwc';
import searchContact from '@salesforce/apex/searchFunctionality.searchContact';
import createContact from '@salesforce/apex/searchFunctionality.createContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import { NavigationMixin } from 'lightning/navigation';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email' },
    { label: 'Phone', fieldName: 'Phone' },
];
export default class LinkContactToAccount extends NavigationMixin(LightningElement) {
    @api recordId; 
    @api accountName;
    searchValue = '';
    data = [];
    columns = columns;
    value = false;
    key;
    recId;
    showbtn = false;
    @api contactId = [];
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

    handleRowAction(event) {
        console.log('Next button Pressed');
        var el = this.template.querySelector('lightning-datatable');
        var selected = el.getSelectedRows();
        if (selected.length > 0) {
            for (const con in selected) {
                this.contactId.push(selected[con].Id);
                console.log(this.contactId);
            }
        }
        if (selected.length == 0) {
            this.contactId = [];
        }
    }

    searchKeyword(event) {
        this.searchValue = event.target.value;
        searchContact({ searchKey: this.searchValue })
            .then(result => {
                if (result != null) {
                    this.value = false;
                    this.key = true;
                    this.showbtn = false;
                    this.data = result;
                    console.log(this.value);
                    console.log(JSON.stringify(result));
                }
                else {
                    this.key = false;
                    this.showbtn = true;
                    if (this.searchValue.length <= 3) {
                        this.key = false;
                    }
                }
            })
            .catch(error => {
                const event = new ShowToastEvent({
                    title: 'Error',
                    variant: 'error',
                    message: error.body.message,
                });
                this.dispatchEvent(event);
                this.contactsRecord = null;
            });
    }
    handleNext() {
        createContact({ Fname: this.FirstName, Lname: this.LastName, Email: this.Email, Phone: this.Phone, AccountId: this.recordId })
            .then(result => {
                console.log(result);
                this.recId = result;
                if (result != null) {
                    const evt = new ShowToastEvent({
                        title: 'Contact created',
                        variant: 'success',
                    });
                    this.dispatchEvent(evt);
                    this.template.querySelectorAll('lightning-input').forEach(element => {
                        if (element.type === 'checkbox' || element.type === 'checkbox-button') {
                            element.checked = false;
                        } else {
                            element.value = null;
                        }
                    });
                    //this.navigatetoRecord();
                    //location.href = '/' + result;
                }
            })
            .catch(error => {
                this.error = error;
                console.log('Error' + this.error);
            });
    }

    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
        const closeParentCmp = new CustomEvent('closeCmp');
        this.dispatchEvent(closeParentCmp);
    }
    handleClick(event) {
        this.value = true;
        this.showbtn = false;
        this.key = false;
    }
    navigatetoRecord() {
        console.log('I am in navigate '+ this.recId);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                 recordId: this.recId, 
                objectApiName: 'Contact',
                actionName: 'view'
            }
        });
    }
}