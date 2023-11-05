trigger OpportunityTrigger on Opportunity (before update) {
    if(trigger.isbefore){
        if(trigger.isupdate){
            CallOpportunityBatch.fetchOppId(trigger.new, trigger.oldMap);
        }
    }
}