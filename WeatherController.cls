public with sharing class WeatherController {
    @AuraEnabled
    public static String getWeatherByCity(String city){
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            String currentCity = city!=''?city: 'London';
            String API_KEY='839464f**********ec105002241008';
            request.setEndpoint('http://api.weatherapi.com/v1/current.json?key='+API_KEY+'&q='+currentCity+'&aqi=no');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            return response.getBody();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
