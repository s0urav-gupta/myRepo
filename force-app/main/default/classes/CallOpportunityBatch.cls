public class CallOpportunityBatch {
    public static void fetchOppId(List<Opportunity> opps, Map<Id, Opportunity> oppOldMap){
        Set<Id> oppIdSet = new Set<Id>();
        Set<Id> accIdSet = new Set<Id>();
        if(!opps.isEmpty()){
            for(Opportunity opp : opps){
                if(opp.StageName == 'Closed Won' && oppOldMap.get(opp.Id).StageName != 'Closed Won'){
                    oppIdSet.add(opp.Id);
                    accIdSet.add(opp.AccountId);
                }
            }
        }
        for(Opportunity opp : [SELECT Id FROM Opportunity WHERE AccountId IN : accIdSet]){
            oppIdSet.add(opp.id);
        }
        if(!oppIdSet.isEmpty()){
            UpdateClosedWonAmountBatch batchClass = new UpdateClosedWonAmountBatch(oppIdSet);
            Database.executeBatch(batchClass);
        }
    }
}