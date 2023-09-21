import '../data/services/webHelperServices.dart';

class ProductServiceAll {
  Future<Map<String, dynamic>?> getFullWeatherData() async {
    Map<String, dynamic>? mapV = await WebHelperService().getFullWeather();
    return mapV;
  }

  Future<Map<String, dynamic>?> getWeatherByCityR(String city,var date) async {
    Map<String, dynamic>? mapV = await WebHelperService().getWeatherByCityDate(city,date);
    return mapV;
  }
}
