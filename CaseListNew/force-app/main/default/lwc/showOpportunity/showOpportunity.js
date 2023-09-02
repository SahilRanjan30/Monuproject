import { LightningElement,api } from 'lwc';
import fetchOpportunity from '@salesforce/apex/FetchAccountDataClass.fetchOpportunity';
export default class ShowOpportunity extends LightningElement {
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
        fetchOpportunity({ id: this.recordId })
            .then(result => {
                console.log(JSON.stringify(result));
                this.AccountName = result.Account.Name;
                this.AnnualRevenue = result.Account.AnnualRevenue;
                this.Website = result.Account.Website;
                this.Description = result.Account.Description;
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