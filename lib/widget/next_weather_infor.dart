import 'package:app_weather/widget/weather_detail_widget.dart';
import 'package:flutter/material.dart';

class NextWeatherInfor extends StatelessWidget {
  final String windSpeed;
  final String humidity;
  final String tempMin;
  final String tempMax;
  final String icon;
  final String description;
  final String time;

  const NextWeatherInfor({
    super.key,
    required this.windSpeed,
    required this.humidity,
    required this.tempMin,
    required this.tempMax,
    required this.icon,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      margin: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(time),
              Image.asset(
                "assets/weather/$icon.png",
                color: Theme.of(context).iconTheme.color,
                width: 50,
              ),
              Text(description)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                          "$tempMin°C/$tempMax°C",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
              Row(
                children: [
                WeatherDetailWidget(
                asset: "assets/icons/humidity.png",
                value: humidity,
                title: "Humidity",
                isIcon: false,
                icon: const Icon(Icons.add),
              ), 
              const SizedBox(width: 10,),
                WeatherDetailWidget(
                asset: "assets/icons/windspeed.png",
                value: windSpeed,
                title: "Wind Speed",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),],
              )
            ],
          ),
        ],
      ),
    );
  }
}
