@isTest
public class exploreHelloWorldTriggerTest {
    static testMethod void foobar(){
        Gadget__c g = new Gadget__c();
        g.Gadget_Type__c='Test';
        g.Price__c=1200;
        
        insert g;
    }
}