import { LightningElement,api } from 'lwc';
import GetContacts from '@salesforce/apex/GetContacts.GetContacts';


const columns = [
    { label: 'FirstName', fieldName: 'FirstName', type:'text' },
    { label: 'LastName', fieldName: 'LastName' ,type:'text'}

];
export default class ContactDetail extends LightningElement {
    @api recordId;
    data = [];
    columns = columns;
    connectedCallback() {
        GetContacts({recId: this.recordId})
        .then(result =>
            {
                this.data=result;
                console.log('Result'+JSON.stringify(result));
                console.log('Result'+JSON.stringify(this.data.concats));
            })
    }
}