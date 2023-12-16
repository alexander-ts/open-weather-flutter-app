import 'package:json_annotation/json_annotation.dart';

part 'ow_main_forecast.g.dart';

@JsonSerializable()
class OWMainForecast {
  OWMainForecast({required this.temp, required this.tempMin, required this.tempMax, required this.humidity});

  final double temp;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;
  final double humidity;

  factory OWMainForecast.fromJson(Map<String, dynamic> json) => _$OWMainForecastFromJson(json);

  Map<String, dynamic> toJson() => _$OWMainForecastToJson(this);
}
