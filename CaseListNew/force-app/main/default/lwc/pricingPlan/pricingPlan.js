import { LightningElement, api,wire,track } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getPricingPlanLst from '@salesforce/apex/ChangePricingPlan.getPricingPlanLst';
import effectiveDate from '@salesforce/apex/ChangePricingPlan.effectiveDate';
import createRecord from '@salesforce/apex/ChangePricingPlan.createRecord';
export default class PricingPlan extends LightningElement {
    @api recordId;
    currDate;
    prcplLst;
    value;
    error;
    @track options = [];
    dateVal;
    pricePlanevt;
    dateEvt;
    pricePlan;
    inputfields;
    dateinput;

    todayDate(){
        const date = new Date();
        const year =  date.getFullYear();
        const month = date.getMonth()+1;
        const dt = date.getDate();
      return this.currDate =  year  + '-' +month + '-'+ dt;
    }
 

   @wire(effectiveDate,{recId:'$recordId'})
    getDate({error,data}){
        if(data){
            this.dateVal = data[0].Unpaid_Session__c;
        } 
        this.dateVal = this.todayDate();

    }
    connectedCallback(){
        getPricingPlanLst()
            .then(result => {
                this.prcplLst = result;
                for(let i=0;i<this.prcplLst.length;i++){
                    this.options.push({label: this.prcplLst[i].Name, value: this.prcplLst[i].Id});
                }
                console.log('opt '+ JSON.stringify(this.options));
            })
    }
   
    showToastMessage(title,message,variant){
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }

    handleSave(){
      const inputfields = this.template.querySelectorAll('lightning-input-field');
      const dateinput = this.template.querySelectorAll('lightning-input');
       if(dateinput){
            dateinput.forEach(field=>{
            this.dateEvt = field.value;
        })
        console.log(this.dateEvt);
       }   
      if(inputfields){
        inputfields.forEach(field=>{
            this.pricePlan = field.value;
            console.log(JSON.stringify(this.pricePlan));
        })
      }
      createRecord({pricingPlanId:this.pricePlan,effectiveDate:this.dateEvt})
      .then(result=>{
        console.log('call apex');
          if(result == 'Success') {
              this.showToastMessage('Success','Record Created', 'success');
              this.handleCancel();
          }else{
              this.showToastMessage('Error','Creating record failed', 'error');
              this.handleCancel();
          }
      })
      .catch(error => {
          this.showToastMessage('Error',error.body.message, 'error');
      });
    }


    handleSuccess(){
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Changed Pricing Plan',
                message: "Successfully Changed Pricing Plan",
                variant: 'success',
            }),
        );
        this.handleCancel();
    }

    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}