public class Users{
 	@AuraEnabled
	public static List<User> getUsers(){
		List<User> Userlist = [SELECT Id, name, username, isactive FROM User WHERE isactive=true];
		return Userlist;
	}
}