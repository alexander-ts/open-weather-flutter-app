// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ow_main_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OWMainForecast _$OWMainForecastFromJson(Map<String, dynamic> json) =>
    OWMainForecast(
      temp: (json['temp'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
    );

Map<String, dynamic> _$OWMainForecastToJson(OWMainForecast instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'humidity': instance.humidity,
    };
