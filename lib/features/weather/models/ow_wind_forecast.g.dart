// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ow_wind_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OWWindForecast _$OWWindForecastFromJson(Map<String, dynamic> json) =>
    OWWindForecast(
      speed: (json['speed'] as num).toDouble(),
      degree: (json['deg'] as num).toDouble(),
    );

Map<String, dynamic> _$OWWindForecastToJson(OWWindForecast instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.degree,
    };
