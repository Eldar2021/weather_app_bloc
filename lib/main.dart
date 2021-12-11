import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:weather_bloc/route/routes/route.dart';

import 'app/app.dart';
import 'data/weather/repositories/weather_repository.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRoute(),
    weatherRepo: WeatherRepo(),
    connectivity: Connectivity(),
  ));
}
