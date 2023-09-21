
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../data/model/city_date_w.dart';

import '../../../styles/app_string.dart';
import '../../../styles/color_resources.dart';
import '../../../styles/constant_doubles_font.dart';
import '../../../styles/image_assets.dart';


class SunState extends StatelessWidget {
  final CityCateW state;

  const SunState({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sunset = getSunTime(state!.sys!.sunset!);
    final sunrise = getSunTime(state!.sys!.sunrise!);

    return Padding(
      padding: const EdgeInsets.only(top: ConstantDoubles.d_10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(ConstantDoubles.d_10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SunStateWidget(
                  sunState: sunrise,
                  sunStateText: SunStateStrings.sunrise,
                  iconAsset: AssetImagesLink.sunrise,
                  iconColor: ColorResources.sunriseIcon!),
              SunStateWidget(
                  sunState: sunset,
                  sunStateText: SunStateStrings.sunset,
                  iconAsset: AssetImagesLink.sunset,
                  iconColor: ColorResources.sunsetIcon!)
            ],
          ),
        ),
      ),
    );
  }

  String getSunTime(var sunState) {
    final codedSunTime = DateTime.fromMillisecondsSinceEpoch(
      sunState * ConstantInt.i_1000,
    );

    final sunTime = DateFormat.jm().format(codedSunTime);
    return sunTime;
  }
}

class SunStateWidget extends StatelessWidget {
  const SunStateWidget({
    Key? key,
    required this.sunState,
    required this.sunStateText,
    required this.iconAsset,
    required this.iconColor,
  }) : super(key: key);

  final String sunStateText;
  final String sunState;
  final String iconAsset;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sunStateText,
        ),
        Text(
          sunState,
        ),
        Image.asset(
          iconAsset,
          color: iconColor,
        ),
      ],
    );
  }
}
