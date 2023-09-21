import 'package:get/get.dart';

import '../../../application/product_service.dart';
import '../../../data/model/city_date_w.dart';
import '../../../data/model/currentLocationWeather.dart';

class HomePageSecondController extends GetxController {

   var selectedValueCity="Lucknow".obs;
  var date=DateTime.now().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFullWeatherDataAccordingCity("Lucknow",date);
  }


  var listCity=["Lucknow","Noida","Basti","Gurgaon","Delhi"];

  var getFullWeatherByCity = CityCateW().obs;

  getFullWeatherDataAccordingCity(String city,date) async {
    Map<String, dynamic>? production =
    await ProductServiceAll().getWeatherByCityR(city,date);
    if (production != null) {
      getFullWeatherByCity.value = CityCateW.fromJson(production);
    } else {
      print("else model vales");
    }
  }
}
