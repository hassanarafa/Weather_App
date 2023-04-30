import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_14/Pages/Search_Page.dart';
import 'package:flutter_application_14/provider/WeatherProvider.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Provider.of<WeatherProvider>(context, listen: true).weatherData ==
              null
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
                statusBarColor: Provider.of<WeatherProvider>(context)
                    .weatherData!
                    .getColor(),
              ),
              backgroundColor:
                  Provider.of<WeatherProvider>(context).weatherData!.getColor(),
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
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Provider.of<WeatherProvider>(context).weatherData!.getColor(),
                  Colors.white,
                ],
              )),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Provider.of<WeatherProvider>(context).cityName!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Provider.of<WeatherProvider>(context)
                            .weatherData!
                            .Last_Updated,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(Provider.of<WeatherProvider>(context)
                              .weatherData!
                              .getImage()),
                          Text(
                            "${Provider.of<WeatherProvider>(context).weatherData!.Temp_C.toInt()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Column(
                            children: [
                              Text(
                                "Wind_Degree : ${Provider.of<WeatherProvider>(context).weatherData!.Wind_Degree}",
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
                        Provider.of<WeatherProvider>(context)
                            .weatherData!
                            .WeatherStateName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                    ]),
              ),
            ),
    );
  }
}
