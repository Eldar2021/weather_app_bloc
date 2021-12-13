import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '/data/weather/repositories/weather_repository.dart';
import 'app/app.dart';

void main() async {
  //final Position? position = await GetLocation().getLocation();
  runApp(MyApp(
    lat: "42.84079362878152",
    lon: "74.5927807318762",
    weatherRepo: WeatherRepo(),
    connectivity: Connectivity(),
  ));
}
