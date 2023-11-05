trigger addEmailAddress on Contact (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.IsUpdate){
            addEmailAddressHandler.addEmail(Trigger.new);
        }
    }
}