
import 'package:flutter/material.dart';

import '../../../../../data/model/currentLocationWeather.dart';
import '../../../styles/app_string.dart';
import '../../../styles/color_resources.dart';
import '../../../styles/constant_doubles_font.dart';
import '../../../styles/image_assets.dart';



class GeneralWeatherState extends StatelessWidget {
  final CurrentLocationWeather state;

  const GeneralWeatherState({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherData = state.list!.first;
    final weatherIcon = weatherData.weather!.first.icon;
    return Padding(
      padding: const EdgeInsets.only(top: ConstantDoubles.d_10),
      child: Card(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // General weather state
              GeneralWeatherWidget(
                icon: Image.network(
                  'http://openweathermap.org/img/wn/$weatherIcon.png',
                ),
                name: GeneralWeatherStateStrings.sky,
                data: "${weatherData!.weather!.first.main}",
              ),
              const WidgetsDivider(),

              // Wind speed
              GeneralWeatherWidget(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: ConstantDoubles.d_10),
                    child: Image.asset(
                      AssetImagesLink.wind,
                    ),
                  ),
                  name: GeneralWeatherStateStrings.wind,
                  data: weatherData.wind!.speed!.toStringAsFixed(0) +
                      GeneralWeatherStateStrings.windSpeed),

              const WidgetsDivider(),

              // Humidity
              GeneralWeatherWidget(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: ConstantDoubles.d_11),
                  child: Image.asset(
                    AssetImagesLink.humidity,
                    color: Colors.white,
                    height: ConstantDoubles.d_30,
                  ),
                ),
                name: GeneralWeatherStateStrings.humidity,
                data: weatherData.main!.humidity.toString() +
                    DaysTempStrings.percent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//_________________________Helper widgets____________________________________________

class WidgetsDivider extends StatelessWidget {
  const WidgetsDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstantDoubles.d_70,
      width: ConstantDoubles.d_1,
      color: ColorResources.greyColor,
    );
  }
}

class GeneralWeatherWidget extends StatelessWidget {
  const GeneralWeatherWidget({
    Key? key,
    required this.icon,
    required this.name,
    required this.data,
  }) : super(key: key);

  final Widget icon;
  final String name;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstantDoubles.d_10),
      child: Column(
        children: [
          // Icon
          SizedBox(
            width: 70,
            height: 70,
            child: icon,
          ),

          // name
          Text(
            name,
            style: const TextStyle(
              fontSize: ConstantDoubles.d_15,
              color: ColorResources.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Data
          Padding(
            padding: const EdgeInsets.symmetric(vertical: ConstantDoubles.d_5),
            child: Text(
              data,
              style: TextStyle(
                color: ColorResources.lightGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
