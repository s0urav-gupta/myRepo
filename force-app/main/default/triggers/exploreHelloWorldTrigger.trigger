trigger exploreHelloWorldTrigger on Gadget__c (before insert, before update) {
    
	for(Gadget__c g : Trigger.new){
		 g.Issued__c = true;
         g.Issued_To__c = '';
    }
}