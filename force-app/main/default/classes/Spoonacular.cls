public class Spoonacular {
    private static final String SPOONACULAR_API = 'https://api.spoonacular.com/';
    private static final String API_KEY = '5475ba3a7c1a417c963ee99a218c7a34';
    @AuraEnabled
    public static String getRandomRecipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+response.getStatusCode());
        if(response.getStatusCode() == 200){
            System.debug('Response '+response.getBody());
            return response.getBody();
        }	
        return '';
    }
    @AuraEnabled
    public static String getRecipe(String receipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'recipes/'+receipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+response.getStatusCode());
        if(response.getStatusCode() == 200){
            System.debug('Response '+response.getBody());
            return response.getBody();
        }	
        return '';
    }
    @AuraEnabled
    public static String getRecipeByIngredients(String ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+response.getStatusCode());
        if(response.getStatusCode() == 200){
            System.debug('Response '+response.getBody());
            return response.getBody();
        }	
        return '';
    }
}