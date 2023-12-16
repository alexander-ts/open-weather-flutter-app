import 'package:dio/dio.dart';
import 'package:open_weather_flutter_app/features/weather/models/ow_response.dart';

class OpenWeatherHttpRepository {
  OpenWeatherHttpRepository({required this.apiPath, required this.apiKey}) {
    dio = Dio(BaseOptions(baseUrl: apiPath));
  }

  final String apiPath;
  final String apiKey;

  late Dio dio;

  Future<OWResponse> getHourlyForecastData(double latitude, double longitude, {int cnt = 4, String lang = 'ru'}) async {
    final response = await dio.get(
      '/forecast',
      queryParameters: {'lat': latitude, 'lon': longitude, 'appId': apiKey, 'cnt': cnt, 'lang': lang},
    );
    return OWResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
