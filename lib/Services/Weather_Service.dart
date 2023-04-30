import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Weather_Models.dart';

class Weather_Service {
  String BaseUrl = "https://api.weatherapi.com";
  String ApiKey = "700afb24553c4723aa602536232904";
  Future<WeatherModel?> getWeather({required String CityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse("$BaseUrl/v1/current.json?key=$ApiKey&q=$CityName");

      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }
    ;
    return weather;
  }
}
