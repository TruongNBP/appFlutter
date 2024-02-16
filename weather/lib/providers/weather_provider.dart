import 'package:flutter/material.dart';
import 'package:weather/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {

  Future<void> getWeatherCurrent() async{
    await ApiRepository.callApiGetWeather();
  }
  
}