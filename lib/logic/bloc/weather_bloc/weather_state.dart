part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  const WeatherState() : super();
}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final String cityName;

  const WeatherLoaded({
    required this.cityName,
  }) : super();
}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherSuccess({
    required this.weatherModel,
  }) : super();
}

class WeatherError extends WeatherState {
  final String error;

  const WeatherError({
    required this.error,
  }) : super();
}

