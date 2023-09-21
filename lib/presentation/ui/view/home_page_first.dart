import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_graph_test_demo/presentation/router/auth_guard.gr.dart';
import 'package:on_graph_test_demo/presentation/ui/view/widgets/5days_weather.dart';
import 'package:on_graph_test_demo/presentation/ui/view/widgets/current_weather_container.dart';
import 'package:on_graph_test_demo/presentation/ui/view/widgets/sun_state.dart';
import 'package:on_graph_test_demo/presentation/ui/view_model/home_page_controller.dart';

import '../styles/color_resources.dart';

@RoutePage()
class HomePageF extends StatelessWidget {
  const HomePageF({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController=Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
          child: Text(
            "Weather",
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
              Obx(() =>
                  homePageController.getFullWeatherDataRes.value.list !=
                      null
                  ? Column(
                children: [
                  CurrentWeatherContainer(
                      state:
                      homePageController.getFullWeatherDataRes.value),
                  FiveDaysForecast(
                      state:
                      homePageController.getFullWeatherDataRes.value),
                  SunState(
                      state:
                      homePageController.getFullWeatherDataRes.value),
                  // GeneralWeatherState(state: homePageController.getFullWeatherDataRes.value),
                  const SizedBox(
                    height: 20,
                  )
                ],
              )
                  : const Center(child: CircularProgressIndicator())),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                   AutoRouter.of(context).push(HomePageSecRoute());

                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      color: ColorResources.sunriseIcon,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      "According to city",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorResources.blackColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
