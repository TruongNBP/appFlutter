import 'package:dio/dio.dart';
import 'package:weather/models/weather.dart';

class ApiRepository {
  static Future<WeatherData> callApiGetWeather() async {
    try {
      final dio = Dio();
    final res = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=10.75&lon=106.6667&units=metric&appid=fd468ca1f12779368e286386dc3df08a');
        final data = res.data;
        WeatherData result = WeatherData.fromMap(data);
        return result;
    } catch (e) {
      throw e;
    }
  }
}
