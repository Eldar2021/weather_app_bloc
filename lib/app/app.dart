import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/data/weather/repositories/weather_repository.dart';
import '/logic/bloc/internet_bloc/internet_bloc.dart';
import '/logic/bloc/weather_bloc/weather_bloc.dart';
import '/route/route_name.dart';
import '/route/route.dart';

class MyApp extends StatelessWidget {
  final WeatherRepo weatherRepo;
  final Connectivity connectivity;
  final String lat;
  final String lon;

  const MyApp({
    Key? key,
    required this.connectivity,
    required this.weatherRepo,
    required this.lat,
    required this.lon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => WeatherBloc(weatherRepo)
                ..add(FetchWeatherEventByLat(lat: lat, long: lon)),
            ),
            BlocProvider(create: (context) => InternetBloc(connectivity)),
          ],
          child: MaterialApp(
            title: 'Material App',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: const Color(0xff000000),
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoute().onGenerateRoute,
            initialRoute: RouteName.HOME,
          ),
        );
      },
    );
  }
}
