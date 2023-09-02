import { LightningElement , api, wire} from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions'; 

const columns = [
    { label: 'Id', fieldName: 'Id'},
    { label: 'Name', fieldName: 'Name'},
    { label: 'StageName', fieldName: 'StageName'},
    { label: 'Type', fieldName: 'Type'},
];

export default class OpportunityDataTableUsingSet extends LightningElement {

    @api recordId;
    
    data = [];
    columns = columns;


    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}