import { LightningElement, track } from 'lwc';

export default class DemoTable006 extends LightningElement {

    //productId = 101;
    //productName = "Bottle";
    //productPrice = 60.00;

    @track
    products = [
        {productId:1001, productName:"Mobile", productPrice:15000},
        {productId:1002, productName:"Tent", productPrice:5000},
        {productId:1003, productName:"Bag", productPrice:120},
        {productId:1004, productName:"Clothes", productPrice:3000}
    ];

    pId; pName; pPrice;

    productIdChange(event){
        this.pId = event.target.value;
    }
    productNameChange(event){
        this.pName = event.target.value;    
    }
    productPriceChange(event){
       this. pPrice = event.target.value;
    }

    addProduct(event){
        alert(this.pId+" "+this.pName+" "+this.pPrice);
        this.products.push({
            productId:this.pId,
            productName:this.pName,
            productPrice:this.pPrice
        });
    }

    deleteData(event){
        //this.products.deleteRecord(event.pId);
        this.products.splice(this.index,1);
    }
}