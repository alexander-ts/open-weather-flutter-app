import 'package:flutter/material.dart';
import 'package:open_weather_flutter_app/config/themes.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({super.key, required this.message, required this.buttonTitle, required this.onButtonTap});

  final String message;
  final String buttonTitle;
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.resolveWith((states) => const Size(400, 48)),
              maximumSize: MaterialStateProperty.resolveWith((states) => const Size(400, 48)),
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
              foregroundColor: MaterialStateProperty.resolveWith((states) => blue),
              textStyle: MaterialStateProperty.resolveWith(
                  (states) => Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
            ),
            onPressed: () => onButtonTap,
            child: Text(buttonTitle),
          ),
        ],
      ),
    );
  }
}
