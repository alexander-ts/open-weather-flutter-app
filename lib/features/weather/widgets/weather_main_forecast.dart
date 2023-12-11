import 'package:flutter/material.dart';
import 'package:open_weather_flutter_app/features/weather/utils.dart';
import 'package:open_weather_flutter_app/features/weather/widgets/weather_icon.dart';

class WeatherMainForecast extends StatelessWidget {
  const WeatherMainForecast(
      {super.key,
      required this.weatherDescription,
      required this.weatherCondition,
      required this.temperature,
      required this.maxTemperature,
      required this.minTemperature});

  final String weatherDescription;
  final String weatherCondition;
  final double temperature;
  final double maxTemperature;
  final double minTemperature;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherIcon(mainWeatherCondition: weatherCondition),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${convertToCelsius(temperature).round()}º',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
              ),
              Text(
                weatherDescription,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'Макс.: ${convertToCelsius(maxTemperature)}º Мин: ${convertToCelsius(minTemperature)}º',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
