import 'package:flutter/material.dart';

Map<String, String> _mainWeatherHourlyIconMap = {
  'Clouds': 'assets/images/CloudSnow.png',
  'Clear': 'assets/images/Sun.png',
  'Rain': 'assets/images/CloudRain.png',
  'Snow': 'assets/images/CloudSnow.png',
  'Thunderstorm': 'assets/images/CloudLightning.png',
  'Drizzle': 'assets/images/CloudMoon.png',
  'Other': 'assets/images/CloudLightning.png',
};

class WeatherHourlyForecast extends StatelessWidget {
  const WeatherHourlyForecast(
      {super.key, this.isCurrent = false, required this.time, required this.forecast, required this.weatherCondition});

  final bool isCurrent;
  final String time;
  final String weatherCondition;
  final String forecast;

  String getRelatedIconAsset() {
    final keyExists = _mainWeatherHourlyIconMap.containsKey(weatherCondition);
    if (keyExists) {
      return _mainWeatherHourlyIconMap[weatherCondition]!;
    } else {
      return _mainWeatherHourlyIconMap['Other']!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrent ? Colors.white.withOpacity(0.4) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isCurrent
            ? const Border(
                top: BorderSide(color: Colors.white),
                left: BorderSide(color: Colors.white),
                bottom: BorderSide(color: Colors.white),
                right: BorderSide(color: Colors.white),
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
          Image.asset(getRelatedIconAsset()),
          Text(
            forecast,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
