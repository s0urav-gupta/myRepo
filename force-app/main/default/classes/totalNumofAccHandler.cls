public class totalNumofAccHandler {
    public static void countAcc(List<Contact> newList, List<Contact> oldList){
        Set<Id> accId = new Set<Id>();
        if(newList != null){
            for(Contact con : newList){
                accId.add(con.AccountId);
            }
        }
        if(oldList != null){
            for(Contact con : oldList){
                accId.add(con.AccountId);
            }
        }
        List<Account> accList = [Select Id, Number_of_Contacts__c, (Select Id FROM Contacts) FROM Account WHERE Id IN :accId];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Number_of_Contacts__c = acc.Contacts.size();
            }
        }
        update accList;
    }
}