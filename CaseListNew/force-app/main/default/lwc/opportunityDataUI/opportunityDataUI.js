import { LightningElement,api } from 'lwc';
import queryOpportunityData from '@salesforce/apex/passOpportunityData.queryOpportunityData';
import printOpportunityData from '@salesforce/apex/passOpportunityData.printOpportunityData';
import { CloseActionScreenEvent } from 'lightning/actions'; 
//Data-table
const columns = [
    { label: 'Id', fieldName: 'Id'},
    { label: 'Name', fieldName: 'Name'},
    { label: 'StageName', fieldName: 'StageName'},
    { label: 'Type', fieldName: 'Type'},
];
var value = [];
export default class OpportunityDataUI extends LightningElement {
    @api recordId;
    data = [];
    columns = columns;
    
    connectedCallback() {
        queryOpportunityData()
        .then(result => {
                console.log('Result is'+result);
                for (var myMap in result) {
                    console.log('valuein mymap '+myMap+' -'+JSON.stringify(result[myMap]));
                    value.push(result[myMap]);
                    console.log('Array is'+JSON.stringify(value));
                }
                this.data= value;
                console.log('Result'+JSON.stringify(this.data));
            })
        .catch(error => {
                console.log(error);
                this.showCustomNotice('Error', reduceErrors(error), 'error');
            });
    }

    handleclick(){
        var el = this.template.querySelector('lightning-datatable'); 
        console.log(el);
        // Javascript, is not a strongly typed language, so, if we are assigning any value to a variable then based on that variable it will 
        // automatically convert it to a type of variable used.
        var selected = el.getSelectedRows();
       // array.push(selected);
        console.log(selected);
        printOpportunityData(({OpportunityId: JSON.stringify(selected)}))
        .then(result =>
            {
                this.data= result;
                console.log('Result '+JSON.stringify(this.data));
                this.handleCancel();
            })
        .catch(error => {
                console.log(error);
                //this.showCustomNotice('Error', reduceErrors(error), 'error');
            });
    }
    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}