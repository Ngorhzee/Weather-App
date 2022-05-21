// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/utilities/constants.dart';
import 'package:weatherapp/views/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    try {
      WeatherData weatherData = WeatherData();
      var data = await weatherData.getWeatherData();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(
                    locationWeather: data,
                  )));

      print(data);
    } catch (e) {
      print(e);
      bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
         
      LocationPermission permission = await Geolocator.requestPermission();
      if (!isLocationServiceEnabled ||permission == LocationPermission.denied) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(
              "An Error Has Occured",
              style: kErrorStyle,
            ),
            content: Text(
              "Turn on your Location in Location settings",
              style: kDescriptionStyle,
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await Geolocator.openAppSettings();
                  await Geolocator.openLocationSettings();
                  WeatherData weatherData = WeatherData();
                  var data = await weatherData.getWeatherData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationScreen(
                                locationWeather: data,
                              )));
                },
                child: const Text(
                  "Open location Settings",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
        ),
      ),
    );
  }
}
