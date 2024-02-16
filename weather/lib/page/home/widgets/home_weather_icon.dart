import 'package:flutter/material.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width /1.5,
      padding: const EdgeInsets.all(20),
      child: Image.asset('assets/images/weathers/lightdrizzle.png',
      fit: BoxFit.cover,
      ),

    );
  }
}
