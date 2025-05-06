// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiLocationResponse _$WeatherApiLocationResponseFromJson(
  Map<String, dynamic> json,
) => WeatherApiLocationResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  region: json['region'] as String,
  country: json['country'] as String,
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  url: json['url'] as String,
);

Map<String, dynamic> _$WeatherApiLocationResponseToJson(
  WeatherApiLocationResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'region': instance.region,
  'country': instance.country,
  'lat': instance.lat,
  'lon': instance.lon,
  'url': instance.url,
};
