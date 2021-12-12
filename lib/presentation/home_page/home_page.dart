import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/weather/repositories/weather_repository.dart';
import '/logic/bloc/internet_bloc/internet_bloc.dart';
import '/logic/bloc/weather_bloc/weather_bloc.dart';
import 'screen/home_screen.dart';

class HomePage extends StatelessWidget {
  final WeatherRepo weatherRepo;
  final Connectivity connectivity;

  const HomePage({
    Key? key,
    required this.weatherRepo,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(weatherRepo)
            ..add(const FetchWeatherEvent(cityName: "Bishkek")),
        ),
        BlocProvider(create: (context) => InternetBloc(connectivity)),
      ],
      child: const HomeScreen(),
    );
  }
}
