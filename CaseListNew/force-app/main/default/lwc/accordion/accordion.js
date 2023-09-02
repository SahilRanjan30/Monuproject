import { LightningElement } from 'lwc';
import fetchAccountData from '@salesforce/apex/accordionContactData.fetchAccountData';

const columns = [
    { label: 'Name', fieldName: 'Name'},
    { label: 'Email', fieldName: 'Email'},
    { label: 'Department', fieldName: 'Department'},
    { label: 'Phone', fieldName: 'Phone'},
];

export default class Accordion extends LightningElement {

    accountData =[];
    columns = columns;

    connectedCallback() {
        fetchAccountData()
        .then((result) =>{
           /* for (const key in result) {
                this.data = result[key].Contacts;
                this.accountData = result[key].Name;
            } */
            //this.data = result.Contacts;
            this.accountData = result;
        })       
        .catch(error => {
            console.log(error);
            this.showCustomNotice('Error', reduceErrors(error), 'error');
        });
    }  

    activeSectionMessage = '';

    handleToggleSection(event) {
        this.activeSectionMessage = event.detail.openSections;
    }

    handleSetActiveSectionC() {
        const accordion = this.template.querySelector('.example-accordion');

        accordion.activeSectionName = 'Account';
    }

    
}