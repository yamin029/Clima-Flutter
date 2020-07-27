import 'dart:math';

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future geCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
