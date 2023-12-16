import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather_flutter_app/features/weather/models/ow_forecast.dart';
import 'package:open_weather_flutter_app/features/weather/repositories/location_repository.dart';
import 'package:open_weather_flutter_app/features/weather/repositories/open_weather_http_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this.weatherRepository,
    this.locationRepository,
  ) : super(WeatherLoadingState()) {
    locationRepository.serviceStatusStream.listen(
      (status) => (status == ServiceStatus.disabled)
          ? emit(WeatherErrorState(WeatherErrorType.locationServiceDisabled))
          : getWeather(),
    );
    getWeather();
  }

  final OpenWeatherHttpRepository weatherRepository;
  final LocationRepository locationRepository;

  Future<void> getWeather() async {
    try {
      emit(WeatherLoadingState());
      final isPermissionsAllowed = await locationRepository.checkPermissions();
      if (isPermissionsAllowed) {
        final position = await locationRepository.determinePosition();
        final response = await weatherRepository.getHourlyForecastData(position.latitude, position.longitude);
        if (response.cod == '200') {
          emit(WeatherLoadedState(response.list, response.city.name, response.list.first, response.city.timezone));
        } else {
          emit(WeatherErrorState(WeatherErrorType.retrievalError));
        }
      } else {
        emit(WeatherErrorState(WeatherErrorType.locationPermissionDenied));
      }
    } catch (e) {
      emit(WeatherErrorState(WeatherErrorType.other));
    }
  }

  void selectForecast(OWForecast forecast, List<OWForecast> forecasts, String city, int timezoneOffset) =>
      emit(WeatherLoadedState(forecasts, city, forecast, timezoneOffset));
}
