import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_flutter_app/config/themes.dart';
import 'package:open_weather_flutter_app/features/weather/widgets/weather_additional_forecast.dart';
import 'package:open_weather_flutter_app/features/weather/widgets/weather_hourly_forecast.dart';
import 'package:open_weather_flutter_app/features/weather/widgets/weather_icon.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [darkBlue, Colors.black],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/pin.svg'),
                      const SizedBox(width: 12),
                      Text(
                        'Архангельск, Россия',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                const WeatherIcon(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '28º',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Гроза',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Макс.: 31º Мин: 25º',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    constraints: const BoxConstraints(
                      minHeight: 230,
                      maxHeight: 230,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Сегодня',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                              ),
                              Text(
                                DateFormat('d MMMM').format(DateTime.now()),
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Row(
                              children: [
                                WeatherHourlyForecast(
                                  time: '14:00',
                                  forecast: '28º',
                                ),
                                WeatherHourlyForecast(
                                  isCurrent: true,
                                  time: '15:00',
                                  forecast: '30º',
                                ),
                                WeatherHourlyForecast(
                                  time: '16:00',
                                  forecast: '25º',
                                ),
                                WeatherHourlyForecast(
                                  time: '17:00',
                                  forecast: '20º',
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: WeatherAdditionalForecast(
                    windSpeed: 10,
                    windDescription: 'Ветер северо-восточный',
                    humidity: 100,
                    humidityDescription: 'Высокая влажность',
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () => context.read<AuthenticationCubit>().signOut(),
                //   child: const Text('Sign Out'),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
