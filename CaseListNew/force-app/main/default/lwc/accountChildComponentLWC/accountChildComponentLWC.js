import { LightningElement,api } from 'lwc';
import fetchRecordForSobject from '@salesforce/apex/GetRecord.fetchRecordForSobject';
export default class AccountChildComponentLWC extends LightningElement {
    @api recordId;
    AccountName;
    Website;
    Description;
    AnnualRevenue;
    connectedCallback() {
        console.log('rec Id '+this.recordId);
        setTimeout(() => {
            this.fetchRecords();
        }, 5);
    }
    fetchRecords(){
        fetchRecordForSobject({ Value : this.recordId })
            .then(result => {
                console.log(JSON.stringify(result));
                this.AccountName = result.Name;
                this.AnnualRevenue = result.AnnualRevenue;
                this.Website = result.Website;
                this.Description = result.Description;
            })
            .catch(error => {
                this.error = error;
                console.log('Error' + this.error);
            });
    }

}