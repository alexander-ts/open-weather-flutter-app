import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_flutter_app/config/themes.dart';
import 'package:open_weather_flutter_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:open_weather_flutter_app/features/weather/cubit/weather_cubit.dart';
import 'package:open_weather_flutter_app/features/weather/utils.dart';
import 'package:open_weather_flutter_app/features/weather/widgets/weather_additional_forecast.dart';
import 'package:open_weather_flutter_app/features/weather/widgets/weather_hourly_forecast.dart';
import 'package:open_weather_flutter_app/features/weather/widgets/weather_icon.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top > 24 ? 0 : 24 - MediaQuery.of(context).padding.top;
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
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                switch (state) {
                  case WeatherRetrievalErrorState():
                    return Center(
                      child: Text(
                        'Произошла ошибка. Пожалуйста, попробуйте еще раз.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                    );
                  case WeatherLoadingState():
                    return const Center(child: CircularProgressIndicator(color: Colors.white));
                  case WeatherLoadedState():
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(24, topPadding, 24, 24),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/pin.svg'),
                              const SizedBox(width: 12),
                              Text(
                                state.city,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                              ),
                              const Expanded(child: SizedBox()),
                              GestureDetector(
                                onTap: () => context.read<AuthenticationCubit>().signOut(),
                                child: Text(
                                  'Выход',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 1),
                        WeatherIcon(mainWeatherCondition: state.current.weatherMain ?? ''),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                state.current.temp != null
                                    ? '${convertToCelsius(state.current.temp!).round()}º'
                                    : 'Неизвестно',
                                style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
                              ),
                              Text(
                                state.current.weatherDescription ?? '',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              //TODO: найди max и min
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
                              maxWidth: 500,
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
                                      // TODO: проверь text style
                                      Text(
                                        'Сегодня',
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                                      ),
                                      Text(
                                        DateFormat('d MMMM', 'ru').format(DateTime.now()),
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(height: 1),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        //TODO: добавь weather icon
                                        //TODO: добавь isCurrent
                                        for (var i = 0; i < 4; i++)
                                          WeatherHourlyForecast(
                                            time: '14:00',
                                            forecast: '28º',
                                            isCurrent: i == 1,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                          child: WeatherAdditionalForecast(
                            windSpeed: state.current.windSpeed,
                            windDescription: state.current.windDegree != null
                                ? 'Ветер ${getCardinalDirection(state.current.windDegree!)}'
                                : '',
                            humidity: state.current.humidity,
                            humidityDescription:
                                state.current.humidity != null ? getHumidityDescription(state.current.humidity!) : '',
                          ),
                        ),
                      ],
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
