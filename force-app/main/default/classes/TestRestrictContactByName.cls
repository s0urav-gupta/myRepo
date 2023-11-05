@isTest
private class TestRestrictContactByName {

	@isTest static void metodoTest() {
		
		List<Contact> listaContatti = new List<Contact>();
		Contact c1 = new Contact(FirstName='Francesco', LastName='Riggio');
		Contact c2 = new Contact(LastName = 'INVALIDNAME');
		listaContatti.add(c1);
		listaContatti.add(c2);
		
		//insert listaContatti;
		
		// Perform test
        Test.startTest();
        Database.SaveResult [] result = Database.insert(listaContatti, false);
        Test.stopTest(); 
		
		c1.LastName = 'INVALIDNAME';
		update c1;
       		
	}
	
}