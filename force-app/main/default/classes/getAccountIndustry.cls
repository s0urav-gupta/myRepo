public with sharing class getAccountIndustry {
    @AuraEnabled(cacheable=true)
    public static List<Account> getIndustry(){
        return [SELECT Id, Industry FROM Account];
    }
}