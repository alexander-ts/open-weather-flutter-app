// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ow_weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OWWeatherForecast _$OWWeatherForecastFromJson(Map<String, dynamic> json) =>
    OWWeatherForecast(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$OWWeatherForecastToJson(OWWeatherForecast instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
    };
