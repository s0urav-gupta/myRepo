public class gadgetExtensions {
    public List<Account> accountList{set;get;}
    public gadgetExtensions(ApexPages.StandardController controller) {
        
    }
    
    public void foobar(){
        accountList = [SELECT Name, Rating, Industry from Account ORDER BY Name LIMIT 5 OFFSET 5];
    }

}