import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper.dart';

class WebHelperService {
  var baseUrl = 'https://api.openweathermap.org/data/2.5/forecast?q=';
  var endPoints = '&units=metric&appid=d1aa58313f58aa9537e9aba1429fabf5';
  var fullWeUrl = 'https://api.openweathermap.org/data/2.5/forecast?';

  Future<Map<String, dynamic>?> getWeatherByCity(String city) async {
    print("ca${baseUrl + city + endPoints}");
    final response = await http.get(Uri.parse(baseUrl + city + endPoints),
        headers: {'Content-Type': 'application/json'});
    print("response body ${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      return null;

    }
  }



  Future<Map<String, dynamic>?> getWeatherByCityDate(String city,var date) async {
    print("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=d1aa58313f58aa9537e9aba1429fabf5&dt=$date");

    final response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=d1aa58313f58aa9537e9aba1429fabf5&dt=$date"),
        headers: {'Content-Type': 'application/json'});
    print("response body ${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      return null;

    }
  }

  Future<Map<String, dynamic>?> getFullWeather() async {
    try {
      if (HelperLatLong.latitude==null && HelperLatLong.longitude==null) {
        await HelperLatLong().handleLocationPermission();

        print("HelperLatLong.latitude${HelperLatLong.latitude}");
        final response = await http.get(
            Uri.parse(
                "${fullWeUrl}lat=${HelperLatLong.latitude}&lon=${HelperLatLong.longitude}&units=metric&appid=d1aa58313f58aa9537e9aba1429fabf5"),
            headers: {'Content-Type': 'application/json'});

        print("response ${response.body}");
        print("response.statusCode ${response.statusCode}");
        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          return null;
          //throw ServerException();
        }
      }
      else
        {
          final response = await http.get(
              Uri.parse(
                  "${fullWeUrl}lat=${HelperLatLong.latitude}&lon=${HelperLatLong.longitude}&units=metric&appid=d1aa58313f58aa9537e9aba1429fabf5"),
              headers: {'Content-Type': 'application/json'});

          print("response ${response.body}");
          print("response.statusCode ${response.statusCode}");
          if (response.statusCode == 200) {
            return jsonDecode(response.body);
          } else {
            return null;
          }

        }
    } catch (E) {
      print("erx$E");
    }
  }
}
