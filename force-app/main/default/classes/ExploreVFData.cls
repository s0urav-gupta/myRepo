public class ExploreVFData {
    public List<Account> accountList{set;get;}
    public void foobar(){
        accountList = [SELECT Name, Industry, Rating FROM Account];
    }
}