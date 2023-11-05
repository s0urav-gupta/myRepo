public class ExploreInnerQuery {
    public List<Account> accountList{set;get;}
    public void fetchRecord(){
    	accountList = [SELECT id, name, rating, industry,(select id, name from contacts)from account];  
        
        for(Account a : accountList){
   	 		System.debug('Account Name : '+a.Name+' Account Rating : '+a.Rating+' Account Industry'+a.Industry);
    		for(Contact c : a.contacts){
        		System.debug(a.Name + ' '+c.Name);
    		}
		}
    }
}