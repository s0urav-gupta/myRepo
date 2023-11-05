public class FishClass {
    
    @AuraEnabled
    public static List<Fish__c> getFish(){
        return [SELECT id, Name, Price__c, Available__c from Fish__c ORDER BY Name];
    }
    
    @AuraEnabled
    public static List<Fish__c> search(String srchFish){
        String searchFish = '%' + srchFish + '%';
        return [SELECT id, Name, Price__c, Available__c from Fish__c WHERE Name LIKE :searchFish];
    }
}