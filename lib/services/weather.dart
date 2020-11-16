import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const kApiKey = 'bad9afa863e4a08839883e0e32d95f61';
const kOpenWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

Location location = Location();

class WeatherModel {
  Future getCityWeather(String city) async {
    String url = '$kOpenWeatherURL?q=$city&appid=$kApiKey&units=metric';

    NetWorkHelper netWorkHelper = NetWorkHelper(url);

    var weatherData = await netWorkHelper.getData();
    return weatherData;
  }

  Future getDataWeather() async {
    await location.getCurrentLocation();
    String url = '$kOpenWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric';

    NetWorkHelper netWorkHelper = NetWorkHelper(url);

    var weatherData = await netWorkHelper.getData();
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
