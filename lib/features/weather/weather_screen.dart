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
import 'package:open_weather_flutter_app/features/weather/widgets/weather_main_forecast.dart';

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
                    return ListView(
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
                        WeatherMainForecast(
                          weatherDescription: state.selectedForecast.weather.first.description,
                          weatherCondition: state.selectedForecast.weather.first.main,
                          temperature: state.selectedForecast.main.temp,
                          maxTemperature: state.selectedForecast.main.tempMax,
                          minTemperature: state.selectedForecast.main.tempMin,
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
                                      Text(
                                        'Сегодня',
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                            ),
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
                                        for (var forecast in state.forecasts)
                                          GestureDetector(
                                            onTap: () => context.read<WeatherCubit>().selectForecast(
                                                forecast, state.forecasts, state.city, state.timezoneOffset),
                                            child: WeatherHourlyForecast(
                                              time: DateFormat('HH:mm', 'ru').format(DateTime.parse(forecast.dt_txt)
                                                  .add(Duration(seconds: state.timezoneOffset))),
                                              forecast: convertToCelsius(forecast.main.temp).round().toString(),
                                              isCurrent: forecast == state.selectedForecast,
                                            ),
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
                            windSpeed: state.selectedForecast.wind.speed,
                            windDescription: 'Ветер ${getCardinalDirection(state.selectedForecast.wind.degree)}',
                            humidity: state.selectedForecast.main.humidity,
                            humidityDescription: getHumidityDescription(state.selectedForecast.main.humidity),
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
