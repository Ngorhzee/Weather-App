import 'package:weatherapp/models/location.dart';
import 'package:weatherapp/models/network_helper.dart';
import 'package:weatherapp/utilities/constants.dart';

class WeatherData{
   CurrentLocation currentLocation =CurrentLocation();
  Future getWeatherData()async{
   var location=await currentLocation.getLocation();
   var url="$openWeather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric";
    NetworkHelper networkHelper=NetworkHelper(url);
   var weatherData=await networkHelper.getData();
   return weatherData;
  }
  Future getCityName(String cityName)async{
    
    String url = "$openWeather?q=$cityName&appid=$apiKey&units=metric";
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData=await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return "It's ๐ฆ time";
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return "You'll need ๐งฃ and ๐งค";
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}