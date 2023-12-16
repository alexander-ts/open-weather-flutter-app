import 'package:json_annotation/json_annotation.dart';

part 'ow_city.g.dart';

@JsonSerializable()
class OWCity {
  OWCity({required this.name, required this.timezone});

  final String name;
  final int timezone;

  factory OWCity.fromJson(Map<String, dynamic> json) => _$OWCityFromJson(json);

  Map<String, dynamic> toJson() => _$OWCityToJson(this);
}
