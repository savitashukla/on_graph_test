import '../data/services/webHelperServices.dart';

class ProductServiceAll {
  Future<Map<String, dynamic>?> getFullWeatherData() async {
    Map<String, dynamic>? mapV = await WebHelperService().getFullWeather();
    return mapV;
  }

  Future<Map<String, dynamic>?> getWeatherByCityR(String city) async {
    Map<String, dynamic>? mapV = await WebHelperService().getWeatherByCity(city);
    return mapV;
  }
}
