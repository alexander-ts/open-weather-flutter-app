import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_flutter_app/config/routes.dart';
import 'package:open_weather_flutter_app/config/themes.dart';
import 'package:open_weather_flutter_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:open_weather_flutter_app/features/authentication/repositories/authentication_repository.dart';
import 'package:open_weather_flutter_app/features/authentication/repositories/firebase_authentication_repository.dart';
import 'package:open_weather_flutter_app/features/weather/cubit/weather/weather_cubit.dart';
import 'package:open_weather_flutter_app/features/weather/repositories/location_repository.dart';
import 'package:open_weather_flutter_app/features/weather/repositories/open_weather_http_repository.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AuthenticationRepository authenticationRepository;
  late final OpenWeatherHttpRepository weatherRepository;
  late final LocationRepository locationRepository;

  @override
  void initState() {
    super.initState();

    weatherRepository = OpenWeatherHttpRepository(
      apiPath: dotenv.env['API_PATH'] ?? '',
      apiKey: dotenv.env['API_KEY'] ?? '',
    );
    authenticationRepository = FirebaseAuthenticationRepository();
    locationRepository = LocationRepository();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: defaultTextTheme),
      navigatorKey: navigatorKey,
      routes: Routes.configureRoutes(),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AuthenticationCubit(authenticationRepository)),
            BlocProvider(create: (_) => WeatherCubit(weatherRepository, locationRepository)),
          ],
          child: BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              switch (state) {
                case AuthenticationSignedInState():
                  navigatorKey.currentState!.pushNamed(Routes.weather);
                  break;
                case AuthenticationSignedOutState():
                  navigatorKey.currentState!.pushNamed(Routes.authentication);
                  break;
                case AuthenticationErrorState():
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  break;
                default:
                  break;
              }
            },
            child: child,
          ),
        );
      },
    );
  }
}
