import { LightningElement, wire } from 'lwc';
import getAllContact from '@salesforce/apex/getContacts.getCon'

export default class DisplayContact extends LightningElement {

    @wire(getAllContact)
    contacts;

    get responseReceived(){
        if(this.contacts){
            return true;
        }
        return false;
    }
}