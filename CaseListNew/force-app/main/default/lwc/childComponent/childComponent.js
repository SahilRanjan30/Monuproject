import { LightningElement,api } from 'lwc';
export default class ChildComponent extends LightningElement {
    @api percentage;
    get getStyle() {
        return 'width:' + this.percentage + '%';
    }
}