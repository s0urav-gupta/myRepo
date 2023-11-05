public class thirdPageController {

    public String message{set;get;}    
    public thirdPageController(){
        message='Apex is cool';
    }

    public void foobar(){
        System.debug('Coding in Apex');
    }
}