import 'package:flutter/material.dart';
import '/presentation/home_page/home_page.dart';
import '/presentation/error_page/screen/error_screen.dart';
import 'route_name.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.HOME:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
