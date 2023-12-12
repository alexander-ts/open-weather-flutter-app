import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_weather_flutter_app/features/authentication/authentication_screen.dart';
import 'package:open_weather_flutter_app/features/weather/weather_screen.dart';

Widget authenticationHandler(_) => const AuthenticationScreen();
Widget weatherHandler(_) => const WeatherScreen();

class Routes {
  static String authentication = '/';
  static String weather = '/weather';

  static Map<String, WidgetBuilder> configureRoutes() {
    return {
      authentication: authenticationHandler,
      weather: weatherHandler,
    };
  }
}
