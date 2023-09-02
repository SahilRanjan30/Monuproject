import { LightningElement,api } from 'lwc';
import methodName from "@salesforce/apex/AccountInfo.methodName";
export default class AccountInfo extends LightningElement {
    accountName;
    accountPhone;
    accountAnnualRevenue;
    accountWebsite;
    caseNumber;
    @api recordId;
    connectedCallback() {
        console.log('Hello There' + this.recordId);
        methodName({ recId: this.recordId })
            .then(result => {
                this.response = result;
                this.accountName = this.response[0].Account.Name;
                this.accountPhone = this.response[0].Account.Phone;
                this.accountAnnualRevenue=this.response[0].Account.AnnualRevenue;   
                this.accountWebsite=this.response[0].Account.Website;
                this.accountWebsite=this.response[0].Account.CaseNumber;
                console.log('result' + JSON.stringify(this.response));
                console.log('resultName' + JSON.stringify(this.accountName));
            })
            .catch(error => {
                this.error = error;
            })
    }
}