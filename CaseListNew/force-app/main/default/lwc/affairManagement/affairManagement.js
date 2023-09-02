import { LightningElement,track } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import searchEngagements from '@salesforce/apex/AffairManagementSearch.searchEngagements';
const columns = [{ label: 'First Name', fieldName: 'FirstName' },
{ label: 'Engagement Type', fieldName: 'Engagement_Type__c' },
{ label: 'EngagementDate', fieldName: 'Engagement_Date__c' },
{ label: 'state', fieldName: 'State__c' }];
export default class AffairManagement extends LightningElement {

    @track searchQuery = '';
    @track showTable = false;   
    searchResults = [];
    engagementType;
    state;
    date;
    columns = columns;
    get typePicklistValues() {
        return [
            {label : 'Call', value : 'Call'},
            {label : 'Meeting', value : 'Meeting'},
            {label : 'Event', value : 'Event'},
            {label : 'Email', value : 'Email'},
            {label : 'Visit', value : 'Visit'}
        ]
    }

    get stateValues() {
        return [
            {label : 'Karnataka', value : 'Karnataka'},
            {label : 'Andhra Pradesh', value : 'Andhra Pradesh'},
            {label : 'Tamil Nadu', value : 'Tamil Nadu'},
            {label : 'Telangana', value : 'Telangana'}
        ]
    }

    

    handleChange(event) {
        let i;
        let checkboxes = this.template.querySelectorAll('[data-id="checkbox"]')
        for(i=0; i<checkboxes.length; i++) {
            checkboxes[i].checked = event.target.checked;
        }
    }

    onClick(event) {
        this.activeTab = event.target.value;
        console.log('active tab ' + this.activeTab);
    }

    handleEngagementTypeChange(event) {
        this.engagementType = event.target.value;
        console.log(this.engagementType);
    }

    handleStateChange(event){
        this.state = event.target.value;
        console.log(this.state);
    }

    handleCancel()
    {
        this.dispatchEvent(new CloseActionScreenEvent());
        const closeParentCmp = new CustomEvent('closeCmp');
        // Fire the custom event
        this.dispatchEvent(closeParentCmp);
    }

    handleSearch()
    {
        this.dispatchEvent(new CloseActionScreenEvent());
        const closeParentCmp = new CustomEvent('closeCmp');
        // Fire the custom event
        this.dispatchEvent(closeParentCmp);
    }

    handleSave()
    {
        this.dispatchEvent(new CloseActionScreenEvent());
        const closeParentCmp = new CustomEvent('closeCmp');
        // Fire the custom event
        this.dispatchEvent(closeParentCmp);
    }

    handleSearchQueryChange(event) {
        this.searchQuery = event.target.value;
    }

    connectedCallback() {
        setTimeout(() => {
            this.handleSearchClick();
        }, 5);
    }

    handleSearchClick() {
        console.log('Before calling Apex');
        searchEngagements({ engagementType : this.engagementType , engagementDate : this.date, attendees : this.attendes, state : this.state, upcomingEngagement : false , previousEngagement : true })
        .then(result => {
            if (result != null) {
                this.searchResults = result;
                console.log(this.searchResults);
            }
            else {
                this.loaded = true;
            }
        })
        .catch(error => {
            this.error = error;
            console.log('error'+ JSON.stringify(this.error));
            this.loaded = true;
        });
        this.showTable = true;
    }
    // Define a function which will show the data-table on click of search button.
}