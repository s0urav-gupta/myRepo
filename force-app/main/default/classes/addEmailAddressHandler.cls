public class addEmailAddressHandler {
    public static void addEmail(List<Contact> trigList){
        if(!trigList.isEmpty()){
            for(Contact con : trigList){
                if(con.FirstName != null && con.LastName != null){
                    con.Email = con.FirstName+'.'+con.LastName+'@salesforce.com';
                }
            }
        }
    }
}