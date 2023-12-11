import 'package:open_weather_flutter_app/features/weather/repositories/weather_repository.dart';
import 'package:weather_pack/weather_pack.dart';

final class OpenWeatherRepository implements WeatherRepository {
  OpenWeatherRepository({required this.openWeatherService, required this.geocodingService});

  final WeatherService openWeatherService;
  final GeocodingService geocodingService;

  @override
  Future<WeatherCurrent> getWeather(double latitude, double longitude) async {
    return await openWeatherService.currentWeatherByLocation(latitude: latitude, longitude: longitude);
  }

  @override
  Future<PlaceGeocode> getPlace(double latitude, double longitude) async {
    final place = await geocodingService.getLocationByCoordinates(latitude: latitude, longitude: longitude, limit: 1);
    return place.first;
  }
}
