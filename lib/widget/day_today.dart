import 'package:app_weather/widget/frosted_glass_current.dart';
import 'package:app_weather/widget/weather_detail_current.dart';
import 'package:flutter/material.dart';

class DayToday extends StatelessWidget {
  final String windSpeed;
  final String windDegree;
  final String pressure;
  final String time;
  final String humidity;
  final String visibility;
  final String temp;
  final String tempMin;
  final String tempMax;
  final String icon;
  final String description;

  final String clouds;

  final String windGust;

  const DayToday({
    super.key,
    required this.windSpeed,
    required this.windDegree,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.icon,
    required this.description,
    required this.clouds,
    required this.windGust,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FrostedGlassCurrent(
              time: time,
              temp: temp,
              tempMin: tempMin,
              tempMax: tempMax,
              icon: icon,
              description: description,
            ),
            WeatherDetailsCurrent(
              windSpeed: windSpeed,
              windDegree: windDegree,
              pressure: pressure,
              humidity: humidity,
              visibility: visibility,
              clouds: clouds,
              windGust: windGust,
            ),
          ],
        ),
      ),
    );
  }
}
