import { LightningElement, wire, track } from 'lwc';

import getAll from '@salesforce/apex/ProductDemo006.getAllProduct'
export default class DataBinding extends LightningElement {
    
    @track
    products=[];
    msgerror;

    @wire(getAll)
    myAllData({data,error}){
        if(data){
            this.products=data;
        }else{
            this.msgerror=error;
        }
        
    }
}