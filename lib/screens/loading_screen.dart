import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '50b27cbc64e45b62e534501aa417ec31';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);
      var decodeData = jsonDecode(data);
      var condition = decodeData['weather'][0]['id'];
      var temperature = decodeData['main']['temp'];
      var cityName = decodeData['name'];
      print(condition);
      print(temperature);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.geCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
