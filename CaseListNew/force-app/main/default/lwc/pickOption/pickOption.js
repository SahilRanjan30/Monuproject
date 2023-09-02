import { LightningElement } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions'; 
export default class PickOption extends LightningElement {

    currentContent;

    handleSelect(event) {
        const selected = event.detail.name;

       /* if (selected === 'Option 1') {
            this.currentContent = selected;
        }

        else if(selected === 'Option 2') {
            this.currentContent = selected;
        }

        else {
            this.currentContent = selected;
        } */
       this.currentContent = selected;
    }

    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}