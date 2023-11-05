@isTest
public class totalNumofAccHandlerTest {
	@testSetup
    static void createData(){
        Account acc = new Account(Name = 'Sample Account');
        insert acc;
        Contact con = new Contact(FirstName = 'Bal', 
                                  LastName = 'Mukund',
                                  AccountId = acc.Id);
        insert con;
        
    }
    @isTest
    static void checkNumofContacts(){
        List<Contact> conList1 = new List<Contact>();
        List<Contact> conList2 = new List<Contact>();
        Contact con = [Select Id, AccountId from Contact Where LastName = 'Mukund'];
        conList1.add(con);
        con.FirstName = 'Vijay';
        con.LastName = 'Kumar';
        update con;
        conList2.add(con);
        Account acc = [Select Id, (Select Id from Contacts) from Account Where Name = 'Sample Account'];
        Test.startTest();
        totalNumofAccHandler.countAcc(conList1, conList2);
        Test.stopTest();
        System.assertEquals(1, acc.Contacts.size());
    }
}