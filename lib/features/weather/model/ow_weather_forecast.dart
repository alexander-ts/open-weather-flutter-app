import 'package:json_annotation/json_annotation.dart';

part 'ow_weather_forecast.g.dart';

@JsonSerializable()
class OWWeatherForecast {
  final int id;
  final String main;
  final String description;

  factory OWWeatherForecast.fromJson(Map<String, dynamic> json) => _$OWWeatherForecastFromJson(json);

  OWWeatherForecast({required this.id, required this.main, required this.description});

  Map<String, dynamic> toJson() => _$OWWeatherForecastToJson(this);
}
