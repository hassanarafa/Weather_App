import 'package:flutter/material.dart';
import 'package:flutter_application_14/Pages/home_page.dart';
import 'package:flutter_application_14/provider/WeatherProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyWidget(),
      ),
    );
  }
}
