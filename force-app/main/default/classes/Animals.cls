public class Animals {
	String name;
    Integer age;
    public void dog(String name, Integer age){
        this.name = name;
        this.age = age;
        System.debug('Dog name : '+name);
        System.debug('Dog age : '+age);
    }
    public void cat(String name, Integer age){
        this.name = name;
        this.age = age;
        System.debug('Cat name : '+name);
        System.debug('Cat age : '+age);
    }
}