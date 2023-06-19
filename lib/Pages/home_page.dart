import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_14/Pages/Search_Page.dart';
import 'package:flutter_application_14/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../widgets/Success.dart';
import '../widgets/failure.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<weather_cubit, Weather_States>(
        builder: (context, state) {
      return Scaffold(
          appBar: BlocProvider.of<weather_cubit>(context).weatherModel == null
              ? AppBar(
                  title: Text('Weather App'),
                  systemOverlayStyle:
                      SystemUiOverlayStyle(statusBarColor: Colors.blue),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Search(),
                              ));
                        },
                        icon: Icon(Icons.search))
                  ],
                )
              : AppBar(
                  title: Text('Weather App'),
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: BlocProvider.of<weather_cubit>(context)
                        .weatherModel!
                        .getColor(),
                  ),
                  backgroundColor: BlocProvider.of<weather_cubit>(context)
                      .weatherModel!
                      .getColor(),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Search(),
                              ));
                        },
                        icon: Icon(Icons.search))
                  ],
                ),
          body: (state is weatherloading)
              ? CircularProgressIndicator()
              : (state is weathersuccess)
                  ? Success()
                  : (state is weatherfailure)
                      ? Text("there is an error")
                      : failure());
    });
  }
}
