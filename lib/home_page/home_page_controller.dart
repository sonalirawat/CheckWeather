import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../app_constants.dart';
import '../wheatherApi.dart';
import '../wheather_data.dart';

class HomePageController extends GetxController {

  final WeatherApi _weatherApi = WeatherApi();
  final _weatherData = Rx<WeatherData?>(null);
  Stream<WeatherData?> get weatherDataStream => _weatherData.stream;


  @override
  void onInit() async {
    super.onInit();
    fetchWeatherData("ABCD");
  }


   fetchWeatherData(String place) {
    _weatherApi.fetchWeatherData(place).then((weatherData) {
      _weatherData.value = weatherData;
    }).catchError((error) {
      debugPrint('Error: $error');
    });
  }


}
