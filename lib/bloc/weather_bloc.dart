import 'package:app_weather/bloc/weather_bloc_event.dart';
import 'package:app_weather/bloc/weather_bloc_state.dart';
import 'package:app_weather/model/current_weather_model.dart';
import 'package:app_weather/model/weather_model.dart';
import 'package:app_weather/repo/weather_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>(
      (event, emit) async {
        if (event is FetchWeather) {          
          emit(WeatherLoading());
          try {           
            WeatherModel? data = await WeatherRepo.dioGetWeatherData();
            CurrentWeatherModel? data1= await WeatherRepo.dioGetWeatherData1();
            if ((data!.cod=='200')&&(data1!.cod==200)) {
              emit(WeatherLoaded(data1,data));
            } else {
              emit(WeatherError());
            }           
          } catch (e) {
            emit(WeatherError());
          }
        }
      },
    );
  }
}
