import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const apiKey='8736667055788c5f6a61d7bc814416ae';
const openWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
       NetworkHelper networkHelper=NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
        var weatherData=await networkHelper.getData();
        return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location loc=Location();
     await loc.getCurrentLocation();
     NetworkHelper networkHelper=NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
     
     var weatherData=await networkHelper.getData();
     return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
