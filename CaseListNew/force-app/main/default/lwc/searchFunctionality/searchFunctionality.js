import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/searchFunctionality.getContactList';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
const columns = [
    { label: 'Id', fieldName: 'Id'},
    { label: 'Name', fieldName: 'Name'},
    { label: 'Email', fieldName: 'Email'},
    { label: 'Phone', fieldName: 'Phone'},
];
export default class customSearch extends LightningElement {
    searchValue = '';    
    data = [];
    columns = columns;
    dataFlag;
    stringLength;
    searchKeyword(event) {
        this.searchValue = event.target.value;
        if (this.searchValue != '' && this.searchValue.length > 3) {
            getContactList({searchKey: this.searchValue})
                .then(result => {
                    if(result.length == 0)
                    {
                        const event = new ShowToastEvent({variant: 'error',message: 'Contact Not Found'});
                        this.dataFlag = false;
                        this.dispatchEvent(event);
                        return;
                    }
                    else
                    {
                        this.dataFlag = true;
                        this.data = result;
                        this.stringLength = result.length();
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
        else
        {
            if(this.searchValue.length <= 3)
            {
                this.dataFlag = false;
            }
        }
    }
    
}