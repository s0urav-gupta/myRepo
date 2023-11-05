public with sharing class getAccountRec {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT Id, Name, Phone, Industry FROM Account ORDER BY CreatedDate DESC LIMIT 10];
    }
}