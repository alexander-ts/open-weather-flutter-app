import 'package:weather_pack/weather_pack.dart';

abstract interface class WeatherRepository {
  Future<WeatherCurrent> getWeather(double latitude, double longitude);

  Future<PlaceGeocode> getPlace(double latitude, double longitude);
}
