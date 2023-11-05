import { LightningElement, wire } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import Industry from '@salesforce/schema/Account.Industry';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Contact';

export default class CreateAccountManager extends LightningElement {
    name; phone; indus;

    handleName(event){
        this.name = event.target.value;
    }
    handlePhone(event){
        this.phone = event.target.value;
    }
    handleIndustry(event){
        this.indus = event.target.value;
    }

    createAccount(){
        const fields = {'Name' : this.name, 'Phone' : this.phone, 'Industry' : this.indus};
        const recordInput = {apiName : 'Account', fields};

        createRecord(recordInput).then(response =>{
            console.log("Record created Successfully : "+response.id);
        }).catch(error => {
            console.log("Error : "+error.body.message);
        });
    }

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountInd;

    @wire(getPicklistValues,
        {
            recordTypeId: '$accountInd.data.defaultRecordTypeId',
            fieldApiName: Industry
        }
    )
    IndustryValues;
}