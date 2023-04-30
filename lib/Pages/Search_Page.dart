import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_14/Services/Weather_Service.dart';
import 'package:flutter_application_14/provider/WeatherProvider.dart';
import 'package:provider/provider.dart';

import '../Models/Weather_Models.dart';

class Search extends StatelessWidget {
  String? CityName;
  Search({this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 172, 92, 32)),
          title: Text("Search_Page"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 172, 92, 32),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
              child: TextField(
            onSubmitted: (value) async {
              CityName = value;
              Weather_Service Weather = Weather_Service();
              WeatherModel? model =
                  await Weather.getWeather(CityName: CityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  model;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  CityName;
              Navigator.pop(context);
            },
            cursorColor: Color.fromARGB(255, 172, 92, 32),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 172, 92, 32))),
                label: Text("Search"),
                border: OutlineInputBorder(),
                hintText: ("enter your city"),
                suffixIcon: Icon(Icons.search)),
          )),
        ));
  }
}
