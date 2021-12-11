class WeatherModel {
  final int? idWeather;
  final String? main;
  final String? description;
  final String? icon;
  final String? base;
  final double temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final double? speedWind;
  final int timezone;
  final int? id;
  final String name;
  final int? cod;

  WeatherModel({
    this.idWeather,
    this.main,
    this.description,
    this.icon,
    this.base,
    required this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.speedWind,
    required this.timezone,
    this.id,
    required this.name,
    this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      idWeather: json["weather"][0]["id"] ?? 0,
      main: json["weather"][0]["main"] ?? "No Data",
      description: json["weather"][0]["description"] ?? "No Data",
      icon: "http://openweathermap.org/img/w/${json["weather"][0]["icon"] ?? "04d"}.png",
      // icon: json["weather"][0]["icon"] ?? "04d",
      base: json["base"] ?? "stations",
      temp: json["main"]["temp"] ?? 0,
      feelsLike: json["main"]["feels_like"] ?? 0,
      tempMin: json["main"]["temp_min"] ?? 0,
      tempMax: json["main"]["temp_max"] ?? 0,
      speedWind: json["wind"]["speed"] ?? 0,
      timezone: json["timezone"] ?? 0,
      id: json["id"] ?? 0,
      name: json["name"] ?? "Элдияр",
      cod: json["cod"] ?? 0,
    );
  }
}
