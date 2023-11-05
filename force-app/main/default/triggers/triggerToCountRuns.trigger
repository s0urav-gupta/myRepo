trigger triggerToCountRuns on Account (before insert, before update) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            for(Account acc : Trigger.new){
                Double count = 0;
                if(acc.count_updates__c != null){
                    count = acc.count_updates__c;
                    count++;
                    acc.count_updates__c = count;    
                }
                else{
                    acc.count_updates__c = 0;
                }
            }        
           
        }
    }
    

}