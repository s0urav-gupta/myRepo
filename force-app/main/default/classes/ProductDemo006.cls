public with sharing class ProductDemo006 {
    public ProductDemo006() {}
    @AuraEnabled
    public static list<Product__c> getAllProduct(){
        List <Product__c> products = [Select Name, Product_Name__c, Product_price__c from Product__c];
        return products;
    }
}