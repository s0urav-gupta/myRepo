public with sharing class getAccountRecords {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccList(){
        return [SELECT Id, Name, AccountNumber from Account Order By CreatedDate DESC LIMIT 10];
    }
}