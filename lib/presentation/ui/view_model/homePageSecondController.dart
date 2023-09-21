import 'package:get/get.dart';

import '../../../application/product_service.dart';
import '../../../data/model/currentLocationWeather.dart';

class HomePageSecondController extends GetxController {

  var selectedValueCity="".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFullWeatherDataAccordingCity("Lucknow");
  }


  var listCity=["Lucknow","Noida","Basti","Gurgaon","Delhi"];

  var getFullWeatherByCity = CurrentLocationWeather().obs;

  getFullWeatherDataAccordingCity(String city) async {
    Map<String, dynamic>? production =
        await ProductServiceAll().getWeatherByCityR(city);
    if (production != null) {
      getFullWeatherByCity.value = CurrentLocationWeather.fromJson(production);
    } else {
      print("else model vales");
    }
  }
}
