import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:on_graph_test_demo/presentation/ui/view/widgets/secondCr/current_weather_container.dart';
import 'package:on_graph_test_demo/presentation/ui/view/widgets/secondCr/sun_state.dart';

import '../styles/color_resources.dart';
import '../view_model/homePageSecondController.dart';

@RoutePage()
class HomePageSec extends StatelessWidget {
  const HomePageSec({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageSecondController homePageController =
        Get.put(HomePageSecondController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
          child: Text(
            "Weather According City",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: ColorResources.blackColor),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ColorResources().dayMainColor,
              ColorResources.daySecondaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),


              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                  homePageController.date.value = pickedDate!;
                  if (pickedDate != null) {

                    homePageController.getFullWeatherDataAccordingCity(
                        homePageController.selectedValueCity.value, pickedDate);
                  } else {}
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Obx(
                            () => Text("${homePageController.date.value}"))),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Obx(
                    () => DropdownButton(
                      icon: Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 13,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/arrow_down.png",
                          color: Colors.black,
                        ),
                      ),
                      isExpanded: true,
                      dropdownColor: ColorResources.sunriseIcon,
                      onChanged: (String? valuem) {
                        homePageController.selectedValueCity.value = valuem!;

                        homePageController.getFullWeatherDataAccordingCity(
                            homePageController.selectedValueCity.value,
                            homePageController.date);
                      },
                      underline: const SizedBox(),
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Select City",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),
                      value: homePageController.selectedValueCity.value == ""
                          ? null
                          : homePageController.selectedValueCity.value,
                      items: homePageController.listCity.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              value,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  color: Colors.black),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              Obx(() => homePageController.getFullWeatherByCity.value.weather !=
                      null
                  ? Column(
                      children: [
                        CurrentWeatherContainer(
                            state:
                                homePageController.getFullWeatherByCity.value),
                        SunState(
                            state:
                                homePageController.getFullWeatherByCity.value),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()))
            ],
          ),
        ),
      ),
    );
  }
}
