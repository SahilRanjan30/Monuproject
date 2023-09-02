import { LightningElement,api, wire} from 'lwc';
import fetchAccountDetail from '@salesforce/apex/accountContactDetail.fetchAccountDetail';

export default class AccountContactPage extends LightningElement {
    columns = [
        { label: 'FirstName', fieldName: 'FirstName'},
        { label: 'LastName', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email'  , type: 'email'},
    
    ];
    @api accountId;
    @wire(fetchAccountDetail,{accountId:'$accountId'}) contacts;
}