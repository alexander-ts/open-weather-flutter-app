import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather_flutter_app/features/weather/models/ow_main_forecast.dart';
import 'package:open_weather_flutter_app/features/weather/models/ow_weather_forecast.dart';
import 'package:open_weather_flutter_app/features/weather/models/ow_wind_forecast.dart';

part 'ow_forecast.g.dart';

@JsonSerializable()
class OWForecast extends Equatable {
  OWForecast({required this.dt, required this.main, required this.wind, required this.weather, required this.dt_txt});

  final int dt;
  final String dt_txt;
  final OWMainForecast main;
  final OWWindForecast wind;
  final List<OWWeatherForecast> weather;

  factory OWForecast.fromJson(Map<String, dynamic> json) => _$OWForecastFromJson(json);

  Map<String, dynamic> toJson() => _$OWForecastToJson(this);

  @override
  List<Object?> get props => [dt];
}
