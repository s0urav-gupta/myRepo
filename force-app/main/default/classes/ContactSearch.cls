public class ContactSearch {
    
    Public static List<Contact> searchForContacts (String Lname,String Fname )
    {
        List <Contact> con = [SELECT Id,Name FROM Contact where Lastname=:Lname and MailingPostalCode=:Fname];
        System.debug(con);
        return con;
    }
}