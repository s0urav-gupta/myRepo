trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account a : Trigger.new)
    {
        if(Trigger.isBefore && Trigger.isInsert){
            if(a.Match_Billing_Address__c && a.BillingPostalCode!=Null)
              a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}