import 'package:app_weather/widget/weather_detail_widget.dart';
import 'package:flutter/material.dart';

class WeatherDetailsCurrent extends StatelessWidget {
  final String windSpeed;
  final String windDegree;
  final String pressure;

  final String humidity;
  final String visibility;
  final String clouds;

  final String windGust;

  const WeatherDetailsCurrent({
    super.key,
    required this.windSpeed,
    required this.windDegree,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.clouds,
    required this.windGust,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherDetailWidget(
                asset: "assets/icons/windspeed.png",
                value: windSpeed,
                title: "Wind Speed",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/winddegree.png",
                value: windDegree,
                title: "Wind Degree",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/pressure.png",
                value: pressure,
                title: "Pressure",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherDetailWidget(
                asset: "assets/icons/humidity.png",
                value: humidity,
                title: "Humidity",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),
              WeatherDetailWidget(
                asset: "",
                value: visibility,
                title: "Visibility",
                isIcon: true,
                icon: const Icon(Icons.visibility_outlined),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherDetailWidget(
                asset: "assets/icons/clouds.png",
                value: clouds,
                title: "Clouds",
                isIcon: false,
                icon: const Icon(Icons.sunny),
              ),
              WeatherDetailWidget(
                asset: "",
                value: windGust,
                title: "Wind Gust",
                isIcon: true,
                icon: const Icon(Icons.wind_power_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
