import 'package:check_wheather/helper.dart';
import 'package:check_wheather/home_page/home_page_controller.dart';
import 'package:check_wheather/wheather_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:check_wheather/app_constants.dart';

import '../autocomplete.dart';

class HomePage extends GetView<HomePageController> {
  final HomePageController homePageController =
      Get.put(HomePageController()); // Initialize the UserController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: const Text(appName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.blue.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                  child: Column(
                    children: [
                      //TextEditField
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: PlacesAutoComplete()),
                      //Button

                      //Wheather Information
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: StreamBuilder<WeatherData?>(
                          stream: homePageController.weatherDataStream,
                          builder: (context, snapshot) {
                            debugPrint(snapshot.data.toString());
                            // if (snapshot.connectionState == ConnectionState.waiting) {
                            //     return const CircularProgressIndicator();
                            // }
                            if (snapshot.hasData) {
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '$wheatherInfo | ${snapshot.data?.name.toString()}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    WeatherInfoRow(
                                      label: place,
                                      value: snapshot.data?.name.toString(),
                                    ),
                                    WeatherInfoRow(
                                      label: condition,
                                      value: snapshot.data?.weather[0].main,
                                    ),
                                    WeatherInfoRow(
                                      label: temprature,
                                      value:
                                          '${Helper().convertKelvinToCelsius(snapshot.data?.main.temp).toStringAsFixed(0)} $degreeCelsius',
                                    ),
                                    WeatherInfoRow(
                                      label: humidity,
                                      value: snapshot.data?.main.humidity
                                          .toString(),
                                    ),
                                    // WeatherInfoRow(
                                    //   label: 'Wind Speed',
                                    //   value: '10 km/h',
                                    // ),
                                  ],
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // If there is no data, display a message accordingly
                              return const Text(noDataError);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class WeatherInfoRow extends StatelessWidget {
  final String label;
  final String? value;

  const WeatherInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label!,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          value!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
