import { LightningElement,api } from 'lwc';
import getAccountContactInfo from '@salesforce/apex/accountContactWrapperClass.getAccountContactInfo';
const columns = [
    { label: 'AccountName', fieldName: 'name', type:'text' },
    { label: 'ContactName', fieldName: 'name' ,type:'text'},
    { label: 'ContactPhone',fieldName:'Phone'},
    { label: 'ContactEmail',fieldName:'Email'}

];
export default class AccountContactDataTable extends LightningElement {
    @api recordId;
    account;
    contact = [];
    columns=columns;
    connectedCallback() {
        getAccountContactInfo({recId: this.recordId})
        .then(result =>
            {
                console.log(result);
            })
    }
}