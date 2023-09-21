import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HelperLatLong {
  static var latitude;
  static var longitude;

  Future<bool?>handleLocationPermission() async {
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high)
            .then((Position position) {
          latitude = position.latitude.toString();
          longitude = position.longitude.toString();
        }).catchError((e) {
          debugPrint("srere $e");
          // return null;
        });

        print("latitude $latitude");

        return true;
      } else if (status.isDenied) {
        return false;
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
        return false;
      }

      return true;
    } catch (E) {
      print("Location $E");
    }
  }
}
