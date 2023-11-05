import { LightningElement, wire } from 'lwc';
import getAccountRecord from '@salesforce/apex/getAccountRec.getAccounts';
export default class GetAccountRecords extends LightningElement {
   
    @wire(getAccountRecord) accounts;

    get responseReceived(){
        if(this.accounts){
            return true;
        }
        return false;
    }

}