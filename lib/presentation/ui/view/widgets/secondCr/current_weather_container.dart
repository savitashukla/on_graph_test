
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../data/model/city_date_w.dart';
import '../../../styles/color_resources.dart';
import '../../../styles/constant_doubles_font.dart';



class CurrentWeatherContainer extends StatelessWidget {
  const CurrentWeatherContainer({
    Key? key,
    required this.state,
  }) : super(key: key);
  final CityCateW state;

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
                ' ${state.main!.temp!.toStringAsFixed(0)}\u00b0 ',
                style: const TextStyle(
                    color: ColorResources.blackColor,
                    fontSize: ConstantDoubles.d_30),
              ),

              // City name
              Row(
                children: [
                  Text(
                    "${state.name}",
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
                '${state.main!.tempMax!.toStringAsFixed(0)}\u00b0 /${state.main!.tempMin!.toStringAsFixed(0)}\u00b0 Feels like ${state.main!.feelsLike!.toStringAsFixed(0)}\u00b0',
                style: const TextStyle(
                    color: ColorResources.blackColor,
                    fontWeight: FontWeight.bold),
              ),



            ],
          ),
        ),

      ],
    );
  }
}
