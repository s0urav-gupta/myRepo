public class StringArrayTest {

    public String myArray { get; set; }
    public static List<string> generateStringArray(Integer n)
    {
        List<string> myArray = new List<string>();
        for(Integer i=0;i<n;i++)
        {
            myArray.add ('Test '+i);
            System.debug(myArray[i]);
        }
       return myArray; 
    }  
}