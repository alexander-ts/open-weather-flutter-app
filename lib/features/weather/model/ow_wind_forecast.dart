import 'package:json_annotation/json_annotation.dart';

part 'ow_wind_forecast.g.dart';

@JsonSerializable()
class OWWindForecast {
  OWWindForecast({required this.speed, required this.degree});

  final double speed;
  @JsonKey(name: 'deg')
  final double degree;

  factory OWWindForecast.fromJson(Map<String, dynamic> json) => _$OWWindForecastFromJson(json);

  Map<String, dynamic> toJson() => _$OWWindForecastToJson(this);
}
