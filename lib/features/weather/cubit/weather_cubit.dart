import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather_flutter_app/features/weather/repositories/weather_repository.dart';
import 'package:weather_pack/weather_pack.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(WeatherLoadingState()) {
    getWeather();
  }

  final WeatherRepository weatherRepository;

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

      final place = await weatherRepository.getPlace(latitude, longitude);
      var cityName = place.name;
      if (place.localNames != null) {
        cityName = place.localNames![WeatherLanguage.russian];
      }
      final weather = await weatherRepository.getWeather(latitude, longitude);

      // convert to Celsius
      emit(WeatherLoadedState(cityName ?? '', weather, []));
    } catch (e) {
      emit(WeatherRetrievalErrorState(e.toString()));
    }
  }
}
