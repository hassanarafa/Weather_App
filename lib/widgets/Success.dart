import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          BlocProvider.of<weather_cubit>(context).weatherModel!.getColor(),
          Colors.white,
        ],
      )),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            BlocProvider.of<weather_cubit>(context).CityName!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            BlocProvider.of<weather_cubit>(context).weatherModel!.Last_Updated,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                BlocProvider.of<weather_cubit>(context)
                    .weatherModel!
                    .getImage(),
              ),
              Text(
                "${BlocProvider.of<weather_cubit>(context).weatherModel!.Temp_C.toInt()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Column(
                children: [
                  Text(
                    "Wind_Degree : ${BlocProvider.of<weather_cubit>(context).weatherModel!.Wind_Degree}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            BlocProvider.of<weather_cubit>(context)
                .weatherModel!
                .WeatherStateName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ]),
      ),
    );
  }
}
