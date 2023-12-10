import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_flutter_app/features/authentication/cubit/authentication_cubit.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Weather Screen'),
            ElevatedButton(
              onPressed: () => context.read<AuthenticationCubit>().signOut(),
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}
