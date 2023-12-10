import 'package:flutter/cupertino.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key});

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
                  blurStyle: BlurStyle.outer,
                )
              ],
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: 180,
            height: 180,
            child: Image.asset('assets/images/variant1.png'),
          ),
        ),
      ],
    );
  }
}
