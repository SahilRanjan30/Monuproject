import { LightningElement,api } from 'lwc';
import fetch from '@salesforce/apex/FetchAccountDataClass.fetch';
export default class ShowAccountData extends LightningElement {
    @api recordId;
    AccountName;
    Website;
    Description;
    AnnualRevenue;
    connectedCallback() {
        setTimeout(() => {
            this.fetchRecords();
        }, 5);
    }
    fetchRecords(){
        fetch({ id: this.recordId })
            .then(result => {
                console.log(JSON.stringify(result));
                this.AccountName = result.Name;
                this.AnnualRevenue = result.AnnualRevenue;
                this.Website = result.Website;
                this.Description = result.Description;
                console.log(this.AccountName);
                console.log(this.AnnualRevenue);
                console.log(this.Website);
                console.log(this.Description);
            })
            .catch(error => {
                this.error = error;
                console.log('Error' + this.error);
            });
    }
}