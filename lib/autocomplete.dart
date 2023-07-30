import 'package:check_wheather/places.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_constants.dart';
import 'home_page/home_page_controller.dart';

class PlacesAutoComplete extends GetView<HomePageController> {
  PlacesAutoComplete({super.key});

  final HomePageController homePageController =
      Get.put(HomePageController()); //

  static const List<Places> _cityOptions = <Places>[
    Places(place: 'Ahmedabad', placeId: "01"),
    Places(place: 'Bengaluru', placeId: "02"),
    Places(place: 'Bhopal', placeId: '03'),
    Places(place: 'Chennai', placeId: '04'),
    Places(place: 'Gurgaon', placeId: '05'),
    Places(place: 'Indore', placeId: '06'),
    Places(place: 'Kolkata', placeId: '07'),
    Places(place: 'Lucknow', placeId: '08'),
    Places(place: 'Nagpur', placeId: '09'),
    Places(place: 'Visakhapatnam', placeId: '10'),
  ];

  String _displayStringForOption(Places option) {
    option.place.length > 2
        ? homePageController.fetchWeatherData(option.place)
        : debugPrint("too short");
    return option.place;
  }

  Widget _defaultFieldViewBuilder(
      BuildContext context,
      TextEditingController textEditingController,
      FocusNode focusNode,
      VoidCallback onFieldSubmitted) {
    return TextField(
      focusNode: focusNode,
      controller: textEditingController,
      onEditingComplete: onFieldSubmitted,
      decoration: const InputDecoration(
        labelText: cityName,
        hintText: hint,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Places>(
      displayStringForOption: _displayStringForOption,
      fieldViewBuilder: _defaultFieldViewBuilder,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Places>.empty();
        }
        return _cityOptions.where((Places option) {
          return option
              .toString()
              .toLowerCase().startsWith(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (Places selection) {
        debugPrint('You just selected ${_displayStringForOption(selection)}');
      },
    );
  }
}
