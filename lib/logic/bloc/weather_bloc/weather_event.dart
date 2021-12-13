part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {
  const WeatherEvent() : super();
}

class FetchWeatherEventByLat extends WeatherEvent {
  final String lat;
  final String long;

  const FetchWeatherEventByLat({
    required this.lat,
    required this.long,
  }) : super();
}

class FetchWeatherEventByName extends WeatherEvent {
  final String cityName;

  const FetchWeatherEventByName({
    required this.cityName,
  }) : super();
}

class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;

  const RefreshWeatherEvent({
    required this.cityName,
  }) : super();
}

