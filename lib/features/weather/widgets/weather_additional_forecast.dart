import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherAdditionalForecast extends StatelessWidget {
  const WeatherAdditionalForecast(
      {super.key,
      required this.windSpeed,
      required this.windDescription,
      required this.humidity,
      required this.humidityDescription});

  final int windSpeed;
  final String windDescription;
  final double humidity;
  final String humidityDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Column(
        children: [
          Row(children: [
            SvgPicture.asset('assets/icons/wind.svg'),
            const SizedBox(width: 8),
            SizedBox(
              width: 56,
              child: Text('$windSpeed м/с'),
            ),
            const SizedBox(width: 24),
            Text(
              windDescription,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
            )
          ]),
          const SizedBox(height: 16),
          Row(children: [
            SvgPicture.asset('assets/icons/drop.svg'),
            const SizedBox(width: 8),
            SizedBox(
              width: 56,
              child: Text('$humidity%'),
            ),
            const SizedBox(width: 24),
            Text(
              humidityDescription,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ]),
        ],
      ),
    );
  }
}
