import 'package:app_weather/model/current_weather_model.dart';
import 'package:app_weather/model/weather_model.dart';
import 'package:app_weather/service/dio_base.dart';
import 'package:app_weather/service/term.dart';

class WeatherRepo {
  static Future<WeatherModel?> dioGetWeatherData() async {
    final dio = DioBase.dioWithBaseOptionGetData();
    try {
      final response = await dio.get(ApiKey.key);
      try {
        return WeatherModel.fromJson((response.data));
      } catch (e) {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<CurrentWeatherModel?> dioGetWeatherData1() async {
    final dio = DioBase.dioWithBaseOptionGetData1();
    try {
      final response = await dio.get(ApiKey.key);
      try {
        return CurrentWeatherModel.fromJson((response.data));
      } catch (e) {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
