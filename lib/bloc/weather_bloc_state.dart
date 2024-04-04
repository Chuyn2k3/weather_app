import 'package:app_weather/model/current_weather_model.dart';
import 'package:app_weather/model/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel data;
  final CurrentWeatherModel data1;
  WeatherLoaded(this.data1, this.data);
}

class WeatherError extends WeatherState {}
