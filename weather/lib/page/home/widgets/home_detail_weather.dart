import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  const HomeDetailWeather(
      {super.key, required this.speed, required this.humidity});

  final num speed;
  final num humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/wind.png'),
            Text(
              '${speed.round()} km/h',
              style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/humidity.png'),
            Text(
              '$humidity %',
              style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
