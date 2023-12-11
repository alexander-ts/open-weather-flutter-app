import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather_flutter_app/features/weather/model/ow_forecast.dart';
import 'package:open_weather_flutter_app/features/weather/repositories/open_weather_http_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(WeatherLoadingState()) {
    getWeather();
  }

  final OpenWeatherHttpRepository weatherRepository;

  void getWeather([double? latitude, double? longitude]) async {
    emit(WeatherLoadingState());
    try {
      if (latitude == null || longitude == null) {
        final enabled = await Geolocator.isLocationServiceEnabled();
        if (!enabled) {
          throw Exception('Необходимо включить сервис Геолокации в настройках.');
        }

        var permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }
        if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
          final position = await Geolocator.getCurrentPosition(
            forceAndroidLocationManager: true,
            desiredAccuracy: LocationAccuracy.low,
          );
          latitude = position.latitude;
          longitude = position.longitude;
        } else {
          throw Exception('Необходимо разрешить доступ к Геолокации в настройках.');
        }
      }

      final response = await weatherRepository.getHourlyForecastData(latitude, longitude);
      if (response.cod == '200') {
        emit(WeatherLoadedState(response.list, response.city.name, response.list.first, response.city.timezone));
      }
    } catch (e) {
      emit(WeatherRetrievalErrorState(e.toString()));
    }
  }

  void selectForecast(OWForecast forecast, List<OWForecast> forecasts, String city, int timezoneOffset) =>
      emit(WeatherLoadedState(forecasts, city, forecast, timezoneOffset));
}
