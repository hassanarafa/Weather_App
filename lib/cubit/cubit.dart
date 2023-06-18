import 'package:flutter_application_14/Models/Weather_Models.dart';
import 'package:flutter_application_14/Services/Weather_Service.dart';
import 'package:flutter_application_14/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class weather_cubit extends Cubit<Weather_States> {
  weather_cubit(this.weatherservice) : super(weatherloading());
  Weather_Service weatherservice;
  WeatherModel? weatherModel;
  void getWeather({required String CityName}) async {
    emit(weatherloading());
    try {
      weatherModel = await weatherservice.getWeather(CityName: CityName);
      emit(weathersuccess());
    } catch (e) {
      emit(weatherfailure());
    }
  }
}
