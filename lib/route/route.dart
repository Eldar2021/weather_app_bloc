import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '/data/weather/repositories/weather_repository.dart';
import '/presentation/home_page/home_page.dart';
import '/presentation/error_page/screen/error_screen.dart';
import 'route_name.dart';

class AppRoute {
  final WeatherRepo weatherRepo = WeatherRepo();
  final Connectivity connectivity = Connectivity();
  Route onGenerateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case RouteName.HOME:
        return MaterialPageRoute(
          builder: (context) => HomePage(
            weatherRepo: weatherRepo,
            connectivity: connectivity,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
