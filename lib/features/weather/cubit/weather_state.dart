part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.city, this.current, this.forecast);

  final String city;
  final WeatherCurrent current;
  final List<WeatherHourly> forecast;
}

final class WeatherRetrievalErrorState extends WeatherState with EquatableMixin {
  WeatherRetrievalErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
