const linkAsset = 'assets/images/weathers/';

class AssetCustom {
  static String getLinkImg (String name) => '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}

class MyKey {
  static const num lon = 106.6667;
  static const num lat = 10.75;
  static const String apiLink =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=fd468ca1f12779368e286386dc3df08a";
}
