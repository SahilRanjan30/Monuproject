import { LightningElement,api,wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import DESCRIPTION_FIELD from '@salesforce/schema/Account.Description';
import ACCOUNT_NUMBER_FIELD from '@salesforce/schema/Account.AccountNumber';
const FIELDS = [ACCOUNT_NAME_FIELD, REVENUE_FIELD, DESCRIPTION_FIELD, ACCOUNT_NUMBER_FIELD];
export default class AccountObjectFields extends LightningElement {
    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    account;    

    get accountNumber() {
        return getFieldValue(this.account.data, ACCOUNT_NUMBER_FIELD);
    }

   get accountName() {
        return getFieldValue(this.account.data, ACCOUNT_NAME_FIELD);
    }

    get revenue() {
        return getFieldValue(this.account.data, REVENUE_FIELD);
    }

    get description() {
        return getFieldValue(this.account.data, DESCRIPTION_FIELD);
    }
}