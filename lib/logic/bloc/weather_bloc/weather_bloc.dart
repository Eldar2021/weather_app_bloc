import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '/data/weather/repositories/weather_repository.dart';
import '/data/weather/weather_model/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepo) : super(WeatherInitial()) {
    on<FetchWeatherEventByLat>(_onFetchWeatherEventByLat);
    on<FetchWeatherEventByName>(_onFetchWeatherEventByName);
    on<RefreshWeatherEvent>(_onRefreshWeatherEvent);
  }

  final WeatherRepo weatherRepo;

  _onFetchWeatherEventByLat(
      FetchWeatherEventByLat event,
      Emitter<WeatherState> emit,
      ) async {
    emit(WeatherLoaded(cityName: event.long));
    try {
      final WeatherModel weatherModel =
      await weatherRepo.getWeatherByLonLat(lat: event.lat, long: event.long);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherError(error: e.toString()));
    }
  }

  _onFetchWeatherEventByName(
    FetchWeatherEventByName event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoaded(cityName: event.cityName));
    try {
      final WeatherModel weatherModel =
          await weatherRepo.getWeatherByName(event.cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherError(error: e.toString()));
    }
  }

  _onRefreshWeatherEvent(
    RefreshWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoaded(cityName: event.cityName));
    try {
      final WeatherModel weatherModel =
          await weatherRepo.getWeatherByName(event.cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherError(error: e.toString()));
    }
  }
}
