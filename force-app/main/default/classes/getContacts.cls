public with sharing class getContacts {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getCon(){
        return [SELECT Id, FirstName, LastName, Email, Phone from Contact Order By CreatedDate DESC LIMIT 10];
    }
}