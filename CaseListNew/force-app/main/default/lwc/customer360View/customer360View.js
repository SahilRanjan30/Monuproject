import { LightningElement } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
export default class Customer360View extends LightningElement {
    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}