@isTest
private class ExploreVFDataTest {
    static testMethod void foobarTest(){
        
        Account a = new Account();
        a.Name='Sam';
        insert a;
        ExploreVFData e = new ExploreVFData();
        e.foobar();
    }
}