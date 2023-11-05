import { LightningElement, track } from 'lwc';
import { createRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateContactManager extends LightningElement {
    @track fname; @track lname; @track phone; @track error;

    handleFName(event){
        this.fname = event.target.value;
    }
    handleLName(event){
        this.lname = event.target.value;
    }
    handlePhone(event){
        this.phone = event.target.value;
    }
    handleSave(){
        const fields = {'FirstName' : this.fname, 'LastName' : this.lname, 'Phone' : this.phone};
        const recordInput = {apiName : 'Contact', fields};

        createRecord(recordInput).then(response => {
            console.log("Contact has been created : "+response.id);
        }).catch(error => {
            console.error("Error in creating Contact : "+error.body.message);
        });
    }
}