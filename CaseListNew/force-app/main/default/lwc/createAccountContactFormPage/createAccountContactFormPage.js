import { LightningElement,api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import CONTACT_FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import CONTACT_LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import CONTACT_EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ACCOUNT_WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import CONTACT_PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import addFile from '@salesforce/apex/createAccountContact.addFile';

export default class CreateAccountContactFormPage extends NavigationMixin(LightningElement) {
    @api recordId;
    accountName;
    contactFirstName;   
    contactLastName;
    contactEmail;
    accountWebsite;
    contactPhone;
    fileData;
    fileName;
    contentId;
    accID = [];

    handleAccountNameChange(event) {
        this.accountName = event.target.value;
    }

    handleContactFirstNameChange(event) {
        this.contactFirstName = event.target.value;
    }

    handleContactLastNameChange(event) {
        this.contactLastName = event.target.value;
    }

    handleContactEmailChange(event) {
        this.contactEmail = event.target.value;
    }

    handleAccountWebsiteChange(event) {
        this.accountWebsite = event.target.value;
    }

    handleContactPhoneChange(event) {
        this.contactPhone = event.target.value;
    }

    get acceptedFormats() {
        return ['.pdf', '.png','.xls'];
    }


    handleUploadFinished(event) {   
        const uploadedFiles = event.detail.files;
        this.contentId =  uploadedFiles[0].documentId;
        console.log(JSON.stringify(uploadedFiles));
    }


    handleCancel(){
        this.clearForm();
    }

    clearForm() {
        console.log('Removing the values');
        this.template.querySelectorAll('lightning-input').forEach(element => {
              if(element.type === 'checkbox' || element.type === 'checkbox-button'){
                element.checked = false;
              }else{
                element.value = null;
              }      
            });
    }

    handleSaveAndNew(){
        let accountId;
        createRecord({ 
            apiName: ACCOUNT_OBJECT.objectApiName, 
            fields: { 
                [NAME_FIELD.fieldApiName]: this.accountName,
                [ACCOUNT_WEBSITE_FIELD.fieldApiName]: this.accountWebsite
            } 
            
        })
        .then(result => {
            accountId = result.id;
            console.log(accountId);
            addFile({documentId:this.accID, accId: accountId})
            .then((data) => {
                this.fileData = data;
                if (data) {
                    this.showToastMessage('SUCCESS', 'File uploaded successfully!', 'success');
                }
            })
            .catch((error) => {
                console.log(error);
            })

            return createRecord({
                apiName: CONTACT_OBJECT.objectApiName,
                fields: {
                    [CONTACT_FIRST_NAME_FIELD.fieldApiName]: this.contactFirstName,	
                    [CONTACT_LAST_NAME_FIELD.fieldApiName]: this.contactLastName,
                    [CONTACT_EMAIL_FIELD.fieldApiName]: this.contactEmail,
                    [CONTACT_PHONE_FIELD.fieldApiName]: this.contactPhone,
                    AccountId: accountId
                }
                
            });

        })
        .then(result => {
            const contactId = result.id;
            const defaultValues = encodeDefaultFieldValues({
                AccountId: accountId,
                ContactId: contactId
            });
    })
    this.dispatchEvent(
        new ShowToastEvent({
            title: 'Success',
            message: 'Record created successfully',
            variant: 'success'
        })
    );
    this.clearForm();
}

    handleUploadFinished(event) {  
        const uploadedFiles = event.detail.files;
        for (let i = 0; i < uploadedFiles.length; i++){
            this.accID.push(uploadedFiles[i].documentId);
        }
    }


    handleSaveClick() {
        let accountId;
        createRecord({ 
            apiName: ACCOUNT_OBJECT.objectApiName, 
            fields: { 
                [NAME_FIELD.fieldApiName]: this.accountName,
                [ACCOUNT_WEBSITE_FIELD.fieldApiName]: this.accountWebsite
            } 
        })
        .then(result => {
            accountId = result.id;
            console.log(accountId);
            addFile({documentId:this.accID, accId: accountId})
            .then((data) => {
                this.fileData = data;
                if (data) {
                    this.showToastMessage('SUCCESS', 'File uploaded successfully!', 'success');
                }
            })

            return createRecord({
                apiName: CONTACT_OBJECT.objectApiName,
                fields: {
                    [CONTACT_FIRST_NAME_FIELD.fieldApiName]: this.contactFirstName,	
                    [CONTACT_LAST_NAME_FIELD.fieldApiName]: this.contactLastName,
                    [CONTACT_EMAIL_FIELD.fieldApiName]: this.contactEmail,
                    [CONTACT_PHONE_FIELD.fieldApiName]: this.contactPhone,
                    AccountId: accountId
                }
            });
        })
        .then(result => {
            const contactId = result.id;
            const defaultValues = encodeDefaultFieldValues({
                AccountId: accountId,
                ContactId: contactId
            });

        
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: contactId,
                    actionName: 'view'
                },
                state: {
                    defaultFieldValues: defaultValues
                }
            });
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Record created successfully',
                    variant: 'success'
                })
            );
        })
    }
}