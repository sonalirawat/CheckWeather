import 'dart:convert';
import 'package:check_wheather/wheather_data.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherData> fetchWeatherData(String place) async {
    const apiKey = 'b3257e61c452dcc761c19d2378555860';
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$place&appid=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));
    WeatherData? weatherData;

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      weatherData = WeatherData.fromJson(jsonData);
      final cityName = jsonData['name'];
      final temperature = jsonData['main']['temp'];
      return weatherData;
    } else {
      return weatherData!;

      throw Exception('Failed to load weather data');
    }
  }
}
