public with sharing class WeatherController {
    @AuraEnabled
    public static String getWeatherByCity(String city){
        try {
            HttpRequest request = new HttpRequest();
            System.debug('city:::'+city);
            String currentCity = city!=''?city: 'London';
            Http http = new Http();
            request.setMethod('POST');
            String API_KEY='839464f8469540898ec105002241008';
            request.setEndpoint('http://api.weatherapi.com/v1/current.json?key='+API_KEY+'&q='+currentCity+'&aqi=no');
            HttpResponse response = http.send(request);
            System.debug('response.getBody():::'+response.getBody());
            return response.getBody();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}