import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_weather_flutter_app/features/authentication/authentication_screen.dart';
import 'package:open_weather_flutter_app/features/splash/splash_screen.dart';
import 'package:open_weather_flutter_app/features/weather/weather_screen.dart';

Widget rootHandler(_) => const SplashScreen();
Widget authenticationHandler(_) => const AuthenticationScreen();
Widget weatherHandler(_) => const WeatherScreen();

class Routes {
  static String root = '/';
  static String authentication = '/authentication';
  static String weather = '/weather';

  static Map<String, WidgetBuilder> configureRoutes() {
    return {
      root: rootHandler,
      authentication: authenticationHandler,
      weather: weatherHandler,
    };
  }
}
