@IsTest
global class AnimalLocatorMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest request){
        System.debug(String.valueOf(this));
        System.debug(String.valueOf(request));
        if(request == null){
            request = new HTTPRequest();
        }
        System.debug(String.valueOf(request));
        HttpResponse response = new HttpResponse();
        System.debug(String.valueOf(response));
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"id": 1, "name": "Goophy"}');
        response.setStatusCode(200);
        return response; 
    }
}