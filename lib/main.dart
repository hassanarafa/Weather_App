import 'package:flutter/material.dart';
import 'package:flutter_application_14/Pages/home_page.dart';
import 'package:flutter_application_14/Services/Weather_Service.dart';
import 'package:flutter_application_14/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return weather_cubit(Weather_Service());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homePage(),
      ),
    );
  }
}
