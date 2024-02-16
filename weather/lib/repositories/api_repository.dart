import 'package:dio/dio.dart';

class ApiRepository {
  static Future<void> callApiGetWeather() async {
    try {
      final dio = Dio();
    final res = dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=10,79011&lon=106,64375&units=metric&appid=fd468ca1f12779368e286386dc3df08a');
        print('123');
    } catch (e) {
      print(e);
    }
  }
}
