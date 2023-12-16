// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OWResponse _$OWResponseFromJson(Map<String, dynamic> json) => OWResponse(
      cod: json['cod'] as String,
      message: messageFromJson(json['message']),
      cnt: json['cnt'] as int,
      list: (json['list'] as List<dynamic>)
          .map((e) => OWForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: OWCity.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OWResponseToJson(OWResponse instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };
