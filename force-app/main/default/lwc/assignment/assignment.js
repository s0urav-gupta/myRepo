import { LightningElement } from 'lwc';

export default class Assignment extends LightningElement {
    name;
    getName(event){
        this.name = this.event.target;
    }
}