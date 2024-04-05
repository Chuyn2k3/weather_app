import 'package:app_weather/bloc/weather_bloc.dart';
import 'package:app_weather/bloc/weather_bloc_event.dart';
import 'package:app_weather/bloc/weather_bloc_state.dart';
import 'package:app_weather/model/current_weather_model.dart';
import 'package:app_weather/model/weather_model.dart';
import 'package:app_weather/widget/day_today.dart';
import 'package:app_weather/widget/next_weather_infor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; //

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getTimeCurrent(int unixTimestamp) {
    DateTime dateTime =
    DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    return formattedDateTime;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fetch = BlocProvider.of<WeatherBloc>(context);
    fetch.add(FetchWeather());
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherLoading) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is WeatherLoaded) {
        City? name = state.data.city;
        List<Infor>? dataForecast = state.data.list;
        CurrentWeatherModel? dataCurrent = state.data1;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${name!.name}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: DayToday(
                    time: getTimeCurrent(dataCurrent.dt!),
                    windSpeed: "${dataCurrent.wind!.speed.toString()} m/s",
                    visibility:
                        '${(dataCurrent.visibility! / 1000).round().toString()} Km',
                    pressure: '${dataCurrent.main!.pressure.toString()} hPa',
                    windDegree: '${dataCurrent.wind!.deg.toString()}°',
                    humidity: '${dataCurrent.main!.humidity.toString()}%',
                    temp: (dataCurrent.main!.temp! - 273).toInt().toString(),
                    tempMin:
                        (dataCurrent.main!.tempMin! - 273).toInt().toString(),
                    tempMax:
                        (dataCurrent.main!.tempMax! - 273).toInt().toString(),
                    icon: dataCurrent.weather![0].icon.toString(),
                    description: dataCurrent.weather![0].description.toString(),
                    clouds: "${dataCurrent.clouds!.all.toString()}%",
                    windGust: "${dataCurrent.wind!.gust.toString()} m/s",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: state.data.cnt,
                    itemBuilder: (context, index) {
                      if (dataForecast != null) {
                        if (dataForecast[index].main != null &&
                            dataForecast[index].main!.tempMax != null) {
                          return NextWeatherInfor(
                            description: dataForecast[index]
                                .weather![0]
                                .description
                                .toString(),
                            humidity:
                                '${dataForecast[index].main!.humidity.toString()}%',
                            icon:
                                dataForecast[index].weather![0].icon.toString(),
                            tempMax: (dataForecast[index].main!.tempMax! - 273)
                                .toInt()
                                .toString(),
                            tempMin: (dataForecast[index].main!.tempMin! - 273)
                                .toInt()
                                .toString(),
                            time: getTimeCurrent(dataForecast[index].dt!),
                            windSpeed:
                                "${dataForecast[index].wind!.speed.toString()} m/s",
                          );
                        }
                        {
                          return const SizedBox();
                        }
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }
      return const Scaffold(body: Center(child: Text('Error Api')));
    });
  }
}
