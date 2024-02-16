import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/page/detail/widgets/detail_body.dart';
import 'package:weather/providers/weather_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<WeatherProvider>().getWeatherDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData)return const Center(child: CircularProgressIndicator());
          List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff1D6CF3),
              elevation: 0,
              centerTitle: false,
              title: Row(
                children: [
                  const Icon(
                    CupertinoIcons.location,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 5000),
                    animatedTexts: [
                      TyperAnimatedText(
                        'Ho Chi Minh City',
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ],
              ),
              actions: const [
                Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            body: Container(
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
              child: DetailBody(listData: listData,),
            ),
          );
        });
  }
}
