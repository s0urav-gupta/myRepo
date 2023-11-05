import { createRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';

export default class AccountRecordForm extends LightningElement {
    accName; accNumber;

    handleAccName(event){
        this.accName = event.target.value;
    }

    handlePhone(event){
        this.accNumber = event.target.value;
    }

    handleSave(){
        const fields = {'Name' : this.accName, 'AccountNumber' : this.accNumber};
        const recordInput = {apiName : 'Account', fields};

        createRecord(recordInput).then(response => {
            console.log("Record created : "+response.id);
        }).catch(error => {
            console.log("Error : "+error.body.message);
        });
    }
}