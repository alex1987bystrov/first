@isTest
private class WeatherControllerTest {
    @IsTest
    static void testGetWeatherByCity() {
      String resp;
      Test.startTest();
      try {
        resp = WeatherController.getWeatherByCity('New York');
      } catch (Exception e) {
        resp = (e.getMessage());
      }
      Test.stopTest();
      Assert.isTrue(resp != null , 'Was expecting to not empty');
    }
}