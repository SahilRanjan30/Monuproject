import { LightningElement } from 'lwc';

export default class Add2Number extends LightningElement {
    
    num2=0;
    
    onChange(event){
        this.num2 = parseInt(event.target.value);
    }
    get value(){
        return  parseInt(this.num2);
    }
}