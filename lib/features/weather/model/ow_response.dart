import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather_flutter_app/features/weather/model/ow_city.dart';
import 'package:open_weather_flutter_app/features/weather/model/ow_forecast.dart';

part 'ow_response.g.dart';

String messageFromJson(dynamic json) => json == 0 ? '' : json.toString();

@JsonSerializable()
class OWResponse {
  OWResponse({required this.cod, required this.message, required this.cnt, required this.list, required this.city});

  final String cod;
  @JsonKey(fromJson: messageFromJson)
  final String message;
  final int cnt;
  final List<OWForecast> list;
  final OWCity city;

  factory OWResponse.fromJson(Map<String, dynamic> json) => _$OWResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OWResponseToJson(this);
}
