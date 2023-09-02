import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import convertLeadToAccountAndOpportunity from '@salesforce/apex/LeadConverter.convertLeadToAccountAndOpportunity';
import { CloseActionScreenEvent } from "lightning/actions";
export default class ConvertLead extends LightningElement {
    @api recordId;
    connectedCallback() {
        setTimeout(() => {
            this.fetchRecords();
        }, 5);
    }
    fetchRecords() {
        convertLeadToAccountAndOpportunity({ leadId: this.recordId })
            .then(result => {
                this.data = result;
                this.handleDismiss();
                this.handleSuccess();
                this.handleRefresh();
                console.log('result'+ JSON.stringify(this.data));
            })
            .catch(error => {
                this.error = error;
            })
    }
    handleDismiss(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }
    handleSuccess(event){
        const evt = new ShowToastEvent({
            title: 'Lead Converted',
            message: 'Successfully Converted',
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
    handleRefresh(){
        window.location.href = '/' + this.recordId;
    }
}
