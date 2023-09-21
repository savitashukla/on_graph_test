
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:on_graph_test_demo/presentation/ui/view_model/homePageSecondController.dart';

void main() {
  test('String should be reversed', (){
    String initial = "lucknow";
    HomePageSecondController onj=Get.put(HomePageSecondController());
    Map<String,dynamic> reversed = onj.getFullWeatherDataAccordingCity(initial);
    expect(reversed["cod"], '200');
  });
}