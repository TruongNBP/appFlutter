import 'package:flutter/material.dart';

const linkAsset = 'assets/images/weathers/';

class AssetCustom {
  static String getLinkImg (String name) => '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}

class MyKey {
  static const num lon = 106.6667;
  static const num lat = 10.75;
  static const String apiLink =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=fd468ca1f12779368e286386dc3df08a";
  static const String apiLinkDetail =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&appid=3e454a93da8405f160ebfe3acfd7078b";
}

Widget createTemp (num temp, {double size = 100}){
  return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  temp.round().toString(),
                  style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "o",
                  style: TextStyle(
                    fontSize: size/3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            );
}