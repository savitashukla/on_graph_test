
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/currentLocationWeather.dart';
import '../../styles/constant_doubles_font.dart';
import '../../styles/color_resources.dart';


class CurrentWeatherContainer extends StatelessWidget {
  const CurrentWeatherContainer({
    Key? key,
    required this.state,
  }) : super(key: key);
  final CurrentLocationWeather state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: ConstantDoubles.d_10, left: ConstantDoubles.d_18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current temp.
              Text(
                ' ${state.list![0].main!.temp!.toStringAsFixed(0)}\u00b0 ',
                style: const TextStyle(
                    color: ColorResources.blackColor,
                    fontSize: ConstantDoubles.d_30),
              ),

              // City name
              Row(
                children: [
                  Text(
                    "${state.city!.name}",
                    style: const TextStyle(
                        color: ColorResources.blackColor,
                        fontSize: ConstantDoubles.d_30),
                  ),
                  const Icon(
                    Icons.location_on,
                    color: ColorResources.blackColor,
                    size: ConstantDoubles.d_18,
                  ),
                ],
              ),
              const SizedBox(
                height: ConstantDoubles.d_40,
              ),

              // Min & max temp for current time
              Text(
                '${state.list![0].main!.tempMax!.toStringAsFixed(0)}\u00b0 /${state.list![0].main!.tempMin!.toStringAsFixed(0)}\u00b0 Feels like ${state.list![0].main!.feelsLike!.toStringAsFixed(0)}\u00b0',
                style: const TextStyle(
                    color: ColorResources.blackColor,
                    fontWeight: FontWeight.bold),
              ),

              // Date time
              Padding(
                padding: const EdgeInsets.only(top: ConstantDoubles.d_8),
                child: Text(
                  '${DateFormat.E().format(DateTime.now())}, ${DateFormat.jm().format(DateTime.now())}',
                  style: const TextStyle(
                    color: ColorResources.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
