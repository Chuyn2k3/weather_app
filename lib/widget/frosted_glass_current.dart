import 'package:flutter/material.dart';

class FrostedGlassCurrent extends StatelessWidget {
  final double borderRadius;

  final String temp;
  final String tempMin;
  final String tempMax;
  final String time;
  final String icon;
  final String description;

  const FrostedGlassCurrent({
    super.key,
    this.borderRadius = 30.0,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.icon,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/weather/$icon.png",
                    width: size.height * 0.2,
                    height: size.height * 0.15,
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      description,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$tempMin°C/$tempMax°C",
                      style:Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18,),
                    ),
                    Text(
                      "$temp°",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
