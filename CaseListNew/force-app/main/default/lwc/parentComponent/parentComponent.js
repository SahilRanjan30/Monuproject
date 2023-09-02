import { LightningElement } from 'lwc';
export default class ParentComponent extends LightningElement {
    percentage = 20;
    changeHandler(event) {
        if (event.target.value <= 0 || event.target.value> 100) {
            this[event.target.name] = 0;    
        } else {
            this[event.target.name] = event.target.value <= 100 ? event.target.value : 100;
        }
    }
}