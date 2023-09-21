
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/currentLocationWeather.dart';
import '../../styles/app_string.dart';
import '../../styles/color_resources.dart';
import '../../styles/constant_doubles_font.dart';
import '../../styles/image_assets.dart';

class FiveDaysForecast extends StatelessWidget {
  final CurrentLocationWeather state;
  const FiveDaysForecast({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListModel> listNewList = [];
    final apiList = state.list;

    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");


    // Filter Api response listNewList to only five days listNewList.
    listNewList.add(apiList!.first);
    for (ListModel i in apiList) {
      if ( (dateFormat.parse("${listNewList.last.dtTxt}")).day == (dateFormat.parse("${i.dtTxt}")).day) {
        listNewList.add(i);
      }
    }

    return Card(
      child: Center(
        child: Container(
          height: ConstantDoubles.d_70,
          width: double.infinity,
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: ConstantDoubles.d_15),
          child: ListView.builder(
            shrinkWrap: true,

            itemCount: 1,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: ConstantDoubles.d_15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Day's temp
                  Text(
                     "${listNewList.last.dtTxt}"

                  ),
                  const Spacer(),

                  //  Humidity
                  Row(
                    children: [
                      const Icon(
                        Icons.water_drop,
                        size: ConstantDoubles.d_10,
                        color: ColorResources.whiteColor,
                      ),
                      const SizedBox(width: ConstantDoubles.d_3),
                      Text(
                        listNewList[index].main!.humidity.toString() +
                            DaysTempStrings.percent,

                      ),
                    ],
                  ),

                  // Sun icon
                  const Padding(
                    padding: EdgeInsets.only(left: ConstantDoubles.d_20),
                    child: Icon(
                      Icons.wb_sunny_rounded,
                    ),
                  ),

                  // Moon icon
                  Padding(
                    padding: const EdgeInsets.only(left: ConstantDoubles.d_20),
                    child: Image.asset(
                      AssetImagesLink.crescent,
                      height: ConstantDoubles.d_20,
                    ),
                  ),

                  // Max temp
                  Padding(
                    padding: const EdgeInsets.only(left: ConstantDoubles.d_20),
                    child: Text(
                      '${(listNewList[index].main!.tempMax + ConstantDoubles.d_10).toStringAsFixed(0)}\u00b0',

                    ),
                  ),

                  // Min temp
                  Padding(
                    padding: const EdgeInsets.only(left: ConstantDoubles.d_20),
                    child: Text(
                      '${listNewList[index].main!.tempMin.toStringAsFixed(0)}\u00b0',

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String getStartTimeHHMMSS(String date_c) {
  return DateFormat("yyyy-MM-dd' 'HH:mm:ss").format(
      DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(date_c, true).toLocal());
}