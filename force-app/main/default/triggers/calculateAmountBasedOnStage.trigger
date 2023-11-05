trigger calculateAmountBasedOnStage on Opportunity (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            for(Opportunity opp : Trigger.new){
                if(opp.StageName.equals('Prospecting'))
                    opp.Amount = 2000;
                else if(opp.StageName.equals('Qualification'))
                    opp.Amount = 3000;
                else if(opp.StageName.equals('Needs Analysis'))
                    opp.Amount = 4000;
            }
        }
    }

}