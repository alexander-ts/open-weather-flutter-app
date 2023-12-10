import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_flutter_app/config/routes.dart';
import 'package:open_weather_flutter_app/config/themes.dart';
import 'package:open_weather_flutter_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:open_weather_flutter_app/features/authentication/repositories/authentication_repository.dart';
import 'package:open_weather_flutter_app/features/authentication/repositories/firebase_authentication_repository.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AuthenticationRepository authenticationRepository;

  @override
  void initState() {
    super.initState();
    authenticationRepository = FirebaseAuthenticationRepository();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: defaultTextTheme),
      navigatorKey: navigatorKey,
      routes: Routes.configureRoutes(),
      builder: (context, child) {
        return BlocProvider(
          create: (_) => AuthenticationCubit(authenticationRepository),
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
