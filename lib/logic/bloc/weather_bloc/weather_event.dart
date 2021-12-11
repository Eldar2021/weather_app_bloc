part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {
  const WeatherEvent() : super();
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;

  const FetchWeatherEvent({
    required this.cityName,
  }) : super();
}

class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;

  const RefreshWeatherEvent({
    required this.cityName,
  }) : super();
}
