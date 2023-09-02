import { LightningElement,wire } from 'lwc';
import getAccount from '@salesforce/apex/retrieveAccountRecord.getAccount';

export default class AccountsRecordsList extends LightningElement {
    @wire(getAccount) accounts;
    accountIdfromparent;
    handleClick(event)
    {
        event.preventDefault();
        this.accountIdfromparent = event.target.dataset.accountId;
    }
}