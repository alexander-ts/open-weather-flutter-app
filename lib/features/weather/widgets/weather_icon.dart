import 'package:flutter/cupertino.dart';

Map<String, String> _mainWeatherIconMap = {
  'Clouds': 'assets/images/variant4.png',
  'Clear': 'assets/images/variant2.png',
  'Rain': 'assets/images/variant3.png',
  'Snow': 'assets/images/variant4.png',
  'Thunderstorm': 'assets/images/variant5.png',
  'Drizzle': 'assets/images/variant6.png',
  'Other': 'assets/images/variant5.png',
};

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, required this.mainWeatherCondition});

  final String mainWeatherCondition;

  String getRelatedIconAsset() {
    final keyExists = _mainWeatherIconMap.containsKey(mainWeatherCondition);

    if (keyExists) {
      return _mainWeatherIconMap[mainWeatherCondition]!;
    } else {
      return _mainWeatherIconMap['Other']!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 140,
            height: 140,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(189, 135, 255, 1),
                  blurRadius: 80,
                  blurStyle: BlurStyle.normal,
                )
              ],
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: 180,
            height: 180,
            child: Image.asset(getRelatedIconAsset()),
          ),
        ),
      ],
    );
  }
}
