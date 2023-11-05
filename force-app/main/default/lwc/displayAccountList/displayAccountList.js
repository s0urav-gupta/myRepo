import { LightningElement, wire } from 'lwc';
import getAccList from '@salesforce/apex/getAccountRecords.getAccList';

export default class DisplayAccountList extends LightningElement {

    @wire(getAccList) accounts;

    get responseReceived(){
        if(this.accounts){
            return true;
        }
        return false;
    }
}