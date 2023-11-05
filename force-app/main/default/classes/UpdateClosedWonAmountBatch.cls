public class UpdateClosedWonAmountBatch implements Database.Batchable<SObject> {
private Set<Id> oppIds;

    public UpdateClosedWonAmountBatch(Set<Id> oppIds) {
        this.oppIds = oppIds;
    }

    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator([
            SELECT Id, Amount, AccountId
            FROM Opportunity
            WHERE Id IN :oppIds
            AND StageName = 'Closed Won'
        ]);
    }

    public void execute(Database.BatchableContext context, List<Opportunity> oppIds) {
        Map<Id, Decimal> accountTotalMap = new Map<Id, Decimal>();

        for (Opportunity opp : oppIds) {
            if (!accountTotalMap.containsKey(opp.AccountId)) {
                accountTotalMap.put(opp.AccountId, 0);
            }
            accountTotalMap.put(opp.AccountId, accountTotalMap.get(opp.AccountId) + opp.Amount);
        }

        List<Account> accountsToUpdate = new List<Account>();

        for (Id accountId : accountTotalMap.keySet()) {
            Account acc = new Account(Id = accountId, 
                                      Total_Closed_Won_Amount__c = accountTotalMap.get(accountId));
            accountsToUpdate.add(acc);
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }

    public void finish(Database.BatchableContext context) {
        system.debug('Batch Processed');
    }
}