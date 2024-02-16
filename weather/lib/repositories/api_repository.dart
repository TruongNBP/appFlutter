import 'package:dio/dio.dart';
import 'package:weather/apps/utils/const.dart';
import 'package:weather/models/weather.dart';

class ApiRepository {
  static Future<WeatherData> callApiGetWeather() async {
    try {
      final dio = Dio();
    final res = await dio.get(
        MyKey.apiLink);
        final data = res.data;
        WeatherData result = WeatherData.fromMap(data);
        return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<WeatherDetail>> callApiGetWeatherDetail() async {
    try {
      final dio = Dio();
    final res = await dio.get(
        MyKey.apiLinkDetail);
        List data = res.data['list'];
        List<WeatherDetail> result = 
        List<WeatherDetail>.from(data.map((e) => WeatherDetail.fromMap(e)).toList());
        return result;
    } catch (e) {
      rethrow;
    }
  }
}
