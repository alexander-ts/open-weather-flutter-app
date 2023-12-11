// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ow_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OWForecast _$OWForecastFromJson(Map<String, dynamic> json) => OWForecast(
      dt: json['dt'] as int,
      main: OWMainForecast.fromJson(json['main'] as Map<String, dynamic>),
      wind: OWWindForecast.fromJson(json['wind'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => OWWeatherForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      dt_txt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$OWForecastToJson(OWForecast instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'dt_txt': instance.dt_txt,
      'main': instance.main,
      'wind': instance.wind,
      'weather': instance.weather,
    };
