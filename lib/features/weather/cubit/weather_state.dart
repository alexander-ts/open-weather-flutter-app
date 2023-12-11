part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.forecasts, this.city, this.selectedForecast, this.timezoneOffset);

  final String city;
  final int timezoneOffset;
  final OWForecast selectedForecast;
  final List<OWForecast> forecasts;
}

final class WeatherRetrievalErrorState extends WeatherState with EquatableMixin {
  WeatherRetrievalErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
