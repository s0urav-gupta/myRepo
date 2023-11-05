@IsTest
public class AnimalLocatorTest {

    @IsTest
    public static void getAnimalNameByIdTest(){
    	Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        //AnimalsCallouts.makeGetCallout();
        String name = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('Goophy', name);

    }
}