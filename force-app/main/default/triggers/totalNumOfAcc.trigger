trigger totalNumOfAcc on Contact (after insert, after update, after delete, after undelete) {
    if(trigger.isAfter){
        if(Trigger.isInsert || Trigger.IsUpdate || Trigger.IsDelete || Trigger.IsUndelete){
            totalNumofAccHandler.countAcc(Trigger.new, Trigger.old);    
        }
    }
}