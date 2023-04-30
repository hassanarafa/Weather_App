import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double Temp_C;
  double Temp_F;
  int Wind_Degree;
  String WeatherStateName;
  String Last_Updated;

  WeatherModel(
      {required this.date,
      required this.Temp_C,
      required this.Temp_F,
      required this.Wind_Degree,
      required this.WeatherStateName,
      required this.Last_Updated});

  factory WeatherModel.fromjson(dynamic data) {
    return WeatherModel(
        date: data["location"]["localtime"],
        Temp_C: data["current"]["temp_c"],
        Last_Updated: data["current"]["last_updated"],
        Temp_F: data["current"]["temp_f"],
        Wind_Degree: data["current"]["wind_degree"],
        WeatherStateName: data["current"]["condition"]["text"]);
  }
  @override
  String toString() {
    return "date = $date\n Temp_C = $Temp_C";
  }

  String getImage() {
    if (WeatherStateName == 'Clear' || WeatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (WeatherStateName == 'Sleet' ||
        WeatherStateName == 'Snow' ||
        WeatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (WeatherStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (WeatherStateName == 'Light Rain' ||
        WeatherStateName == 'Heavy Rain' ||
        WeatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (WeatherStateName == 'Thunderstorm' ||
        WeatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (WeatherStateName == 'Clear' || WeatherStateName == 'Light Cloud') {
      return Colors.amber;
    } else if (WeatherStateName == 'Sleet' ||
        WeatherStateName == 'Snow' ||
        WeatherStateName == 'Hail') {
      return Colors.blueGrey;
    } else if (WeatherStateName == 'Partly cloudy') {
      return Colors.blue;
    } else if (WeatherStateName == 'Light Rain' ||
        WeatherStateName == 'Heavy Rain' ||
        WeatherStateName == 'Showers') {
      return Colors.yellow;
    } else if (WeatherStateName == 'Thunderstorm' ||
        WeatherStateName == 'Thunder') {
      return Colors.grey;
    } else {
      return Colors.amber;
    }
  }
}
