import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather_flutter_app/features/weather/repositories/weather_repository.dart';
import 'package:weather_pack/weather_pack.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(WeatherLoadingState()) {
    getWeather(57.152, 65.527);
  }

  final WeatherRepository weatherRepository;

  void getWeather(double latitude, double longitude) async {
    emit(WeatherLoadingState());
    try {
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
