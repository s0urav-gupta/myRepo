import { LightningElement, wire, track } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import Industry from '@salesforce/schema/Account.Industry';
import Type from '@salesforce/schema/Account.Type';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateAccountContact extends LightningElement {
    name; 
    phone; 
    industry; 
    type;
    conFirstName;
    conLastName;
    conEmail;
    accountId;
    flag = false;
    @track contactList = [];
    addContact = false;
    createContactVisibility = 'visible';
    
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountIndustry;

    @wire(getPicklistValues,
        {
            recordTypeId: '$accountIndustry.data.defaultRecordTypeId',
            fieldApiName: Industry
        }
    )
    IndustryPicklistValues;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountType;

    @wire(getPicklistValues,
        {
            recordTypeId: '$accountType.data.defaultRecordTypeId',
            fieldApiName: Type
        }
    )
    TypePicklistValues;

    handleName(event){
        this.name = event.target.value;
    }

    handlePhone(event){
        this.phone = event.target.value;
    }

    handleIndustry(event){
        this.industry = event.target.value;
    }

    handleType(event){
        this.type = event.target.value;
    }

    handleFirstname(event){
        this.conFirstName = event.target.value;
    }

    handleLastname(event){
        this.conLastName = event.target.value;
    }

    handleEmail(event){
        this.conEmail = event.target.value;
    }

    pushContacts(){
        if(this.conLastName != '' && this.conEmail != ''){
            const contactList = {
                firstname: this.conFirstName,
                lastname: this.conLastName,
                email: this.conEmail
            };
            this.conFirstName = '';
            this.conLastName = '';
            this.conEmail = '';
            this.contactList.push(contactList);
            this.flag = this.contactList.length > 0 ? true : false;
            console.log("->"+JSON.stringify(this.contactList));
        } else {
            this.showNotification("Fields required", "Lastname and email is required", "error");
        }
    }

    createAccount() {
        return new Promise((resolve, reject) => {
            const fields = { 'Name': this.name, 'Phone': this.phone, 'Industry': this.industry, 'Type': this.type };
            const recordInput = { apiName: 'Account', fields };
            createRecord(recordInput)
            .then(response => {
                console.log('Record Created successfully: ' + response.id);
                this.accountId = response.id;
                console.log('Record: ' + this.accountId);
                this.name = '';
                this.phone = '';
                this.industry = '';
                this.type = '';
                this.showNotification("Account Created!", "Account Record Id: " + response.id, "success");
                resolve(response.id); // Resolve the Promise with the response.id
            }).catch(error => {
                this.showNotification("Error!", error.body.message, "error");
                reject(error); // Reject the Promise with the error
            });
        }).then(accountId => {
                console.log('outside if->' + this.accountId);
                if (this.accountId != null && this.accountId !== '') {
                    console.log('inside if->' + this.accountId);
                    this.createContact(this.accountId);
                }   
            });
    }

    createContact(accId){
        console.log('accId->'+accId);
        const fields=[]; var fname, lname, email;
        for (const contact of this.contactList) {
            console.log(contact.firstname+" "+contact.lastname+" "+contact.email);
            //const contactFields = {'FirstName' : contact.firstname, 'LastName' : contact.lastname, 'Email' : contact.email, 'AccountId' : accId};
            fields.push({'FirstName' : contact.firstname, 'LastName' : contact.lastname, 'Email' : contact.email, 'AccountId' : accId});
            fname = contact.firstname;
            lname = contact.lastname;
            email = contact.email
        }
        const f = {'FirstName' : fname, 'LastName' : lname, 'Email' : email, 'AccountId' : accId}
        console.log('fields: '+f);
        const recordInput = {apiName : 'Contact', f};
        createRecord(recordInput).then(response=>{
            console.log('Record Created successfully: '+response.id);
        }).catch(error =>{
            console.log('Error: '+error.body.message);
        });
    }

    addContactLayout(){
        this.addContact = true;
        this.createContactVisibility = 'not-visible';
    }

    closeContactForm(){
        this.addContact = false;
        this.createContactVisibility = 'visible';
    }

    showNotification(title, message, variant){
        const evt = new ShowToastEvent({
                title: title,
                message: message,
                variant: variant,
                mode: 'dismissable'
            });
            this.dispatchEvent(evt);
    }
}