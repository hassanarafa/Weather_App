import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_14/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  Search({super.key});

  @override
  Widget build(BuildContext context) {
    String? CityName;
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
            onSubmitted: (value) {
              CityName = value;
              BlocProvider.of<weather_cubit>(context)
                  .getWeather(CityName: CityName!);
              BlocProvider.of<weather_cubit>(context).CityName = CityName;
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
