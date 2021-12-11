import 'package:flutter/material.dart';
import 'package:weather_bloc/presentation/screens/error_screen.dart';
import 'package:weather_bloc/presentation/screens/home_screen.dart';
import 'package:weather_bloc/route/names/route_name.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.HOME:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
