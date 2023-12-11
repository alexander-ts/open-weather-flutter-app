import 'package:flutter/material.dart';

class WeatherHourlyForecast extends StatelessWidget {
  const WeatherHourlyForecast({super.key, this.isCurrent = false, required this.time, required this.forecast});

  final bool isCurrent;
  final String time;
  final String forecast;

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
          Image.asset('assets/images/Sun.png'),
          Text(
            forecast,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
