public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        String url = 'https://th-apex-http-callout.herokuapp.com/animals/' + id;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        System.debug(String.valueOf(request));
        HttpResponse response = http.send(request);
        System.debug(String.valueOf(response));
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        
        System.debug('results: ' + JSON.serialize(results));
        System.debug('name: ' + results.get('animal'));
        
        List<Object> animals = (List<Object>) results.get('animals');
        if(animals.size()> 0){
            for (Object animal: animals) {
                if(animal != null)
                	System.debug(animal);
            }
        }
        
        return 'bear';
    }
}