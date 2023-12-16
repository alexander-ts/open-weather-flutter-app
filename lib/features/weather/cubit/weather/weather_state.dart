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

enum WeatherErrorType {
  locationServiceDisabled,
  locationPermissionDenied,
  retrievalError,
  other,
}

final class WeatherErrorState extends WeatherState with EquatableMixin {
  WeatherErrorState(this.type);

  final WeatherErrorType type;

  @override
  List<Object?> get props => [type];
}
