import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/data/weather/repositories/weather_repository.dart';
import 'package:weather_bloc/logic/bloc/internet_bloc/internet_bloc.dart';
import 'package:weather_bloc/logic/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc/route/names/route_name.dart';
import 'package:weather_bloc/route/routes/route.dart';

class MyApp extends StatelessWidget {
  final AppRoute appRouter;
  final WeatherRepo weatherRepo;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.weatherRepo,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          InternetBloc(connectivity)..add(InternetListenEvent()),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(weatherRepo)
            ..add(const FetchWeatherEvent(cityName: "Bishkek")),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: RouteName.HOME,
      ),
    );
  }
}
