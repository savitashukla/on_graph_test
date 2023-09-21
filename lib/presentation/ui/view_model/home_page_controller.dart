import 'package:get/get.dart';

import '../../../application/product_service.dart';
import '../../../data/model/currentLocationWeather.dart';

class HomePageController extends GetxController {
  var getFullWeatherDataRes = CurrentLocationWeather().obs;

  @override
  void onInit() {
    super.onInit();
    getFullWeatherDataAll();
  }

  getFullWeatherDataAll() async {
    Map<String, dynamic>? production =
        await ProductServiceAll().getFullWeatherData();
    if(production!=null)
      {
        getFullWeatherDataRes.value = CurrentLocationWeather.fromJson(production);
      }
    else
      {
        print("else model vales");
      }

  }


}
