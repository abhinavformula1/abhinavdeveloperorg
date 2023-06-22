public with sharing class AnimalLocator {

    public static HttpResponse getAnimalNameById(Integer id , String str) {

        HttpResponse request = new HttpResponse();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/str/id');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        return response.getBody();
    }
}