import 'package:dio/dio.dart';
import '/constants/rest_api/rest_api_constants.dart';
import '../weather_model/weather_model.dart';

class WeatherRepo {
  final Dio dio = Dio();

  Future<WeatherModel> getWeather(String name) async {
    final response = await dio.get(
      "${RestApiConstants.baseUrl}weather?q=$name,&appid=${RestApiConstants.apiKey}",
    );
    if (response.statusCode == 200) {
      final dynamic result = response.data;
      return WeatherModel.fromJson(result);
    } else {
      throw Exception("your have error");
    }
  }
}
