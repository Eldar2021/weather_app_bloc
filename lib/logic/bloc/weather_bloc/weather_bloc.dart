import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_bloc/data/weather/repositories/weather_repository.dart';
import 'package:weather_bloc/data/weather/weather_model/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepo) : super(const WeatherLoaded(cityName: "Osh")) {
    on<FetchWeatherEvent>(_onFetchWeatherEvent);
    on<RefreshWeatherEvent>(_onRefreshWeatherEvent);
  }

  final WeatherRepo weatherRepo;

  _onFetchWeatherEvent(
    FetchWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoaded(cityName: event.cityName));
    try {
      final WeatherModel weatherModel =
          await weatherRepo.getWeather(event.cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherError());
    }
  }

  _onRefreshWeatherEvent(
    RefreshWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoaded(cityName: event.cityName));
    try {
      final WeatherModel weatherModel =
          await weatherRepo.getWeather(event.cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherError());
    }
  }
}
