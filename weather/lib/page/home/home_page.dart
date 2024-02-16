import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/page/home/widgets/home_detail_weather.dart';
import 'package:weather/page/home/widgets/home_location.dart';
import 'package:weather/page/home/widgets/home_temperature.dart';
import 'package:weather/page/home/widgets/home_weather_icon.dart';
import 'package:weather/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1D6CF3),
              Color(0xff19D2FE),
            ],
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeWeatherIcon(),
            HomeTemperature(),
            HomeLocation(),
            SizedBox(
              height: 40,
            ),
            HomeDetailWeather(),
          ],
        ),
      ),
    );
  }
}
