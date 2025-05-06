// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiResponse _$WeatherApiResponseFromJson(Map<String, dynamic> json) =>
    WeatherApiResponse(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      alerts: Alerts.fromJson(json['alerts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherApiResponseToJson(WeatherApiResponse instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'current': instance.current.toJson(),
      'forecast': instance.forecast.toJson(),
      'alerts': instance.alerts.toJson(),
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  name: json['name'] as String,
  region: json['region'] as String,
  country: json['country'] as String,
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  tzId: json['tz_id'] as String,
  localtimeEpoch: (json['localtime_epoch'] as num).toInt(),
  localtime: json['localtime'] as String,
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'name': instance.name,
  'region': instance.region,
  'country': instance.country,
  'lat': instance.lat,
  'lon': instance.lon,
  'tz_id': instance.tzId,
  'localtime_epoch': instance.localtimeEpoch,
  'localtime': instance.localtime,
};

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
  lastUpdatedEpoch: (json['last_updated_epoch'] as num).toInt(),
  lastUpdated: json['last_updated'] as String,
  tempC: (json['temp_c'] as num).toDouble(),
  tempF: (json['temp_f'] as num).toDouble(),
  isDay: (json['is_day'] as num).toInt(),
  condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
  windMph: (json['wind_mph'] as num).toDouble(),
  windKph: (json['wind_kph'] as num).toDouble(),
  windDegree: (json['wind_degree'] as num).toInt(),
  windDir: json['wind_dir'] as String,
  pressureMb: (json['pressure_mb'] as num).toInt(),
  pressureIn: (json['pressure_in'] as num).toDouble(),
  precipMm: (json['precip_mm'] as num).toDouble(),
  precipIn: (json['precip_in'] as num).toDouble(),
  humidity: (json['humidity'] as num).toInt(),
  cloud: (json['cloud'] as num).toInt(),
  feelslikeC: (json['feelslike_c'] as num).toDouble(),
  feelslikeF: (json['feelslike_f'] as num).toDouble(),
  windchillC: (json['windchill_c'] as num).toDouble(),
  windchillF: (json['windchill_f'] as num).toDouble(),
  heatindexC: (json['heatindex_c'] as num).toDouble(),
  heatindexF: (json['heatindex_f'] as num).toDouble(),
  dewpointC: (json['dewpoint_c'] as num).toDouble(),
  dewpointF: (json['dewpoint_f'] as num).toDouble(),
  visKm: (json['vis_km'] as num).toDouble(),
  visMiles: (json['vis_miles'] as num).toDouble(),
  uv: (json['uv'] as num).toDouble(),
  gustMph: (json['gust_mph'] as num).toDouble(),
  gustKph: (json['gust_kph'] as num).toDouble(),
  airQuality: AirQuality.fromJson(json['air_quality'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
  'last_updated_epoch': instance.lastUpdatedEpoch,
  'last_updated': instance.lastUpdated,
  'temp_c': instance.tempC,
  'temp_f': instance.tempF,
  'is_day': instance.isDay,
  'condition': instance.condition.toJson(),
  'wind_mph': instance.windMph,
  'wind_kph': instance.windKph,
  'wind_degree': instance.windDegree,
  'wind_dir': instance.windDir,
  'pressure_mb': instance.pressureMb,
  'pressure_in': instance.pressureIn,
  'precip_mm': instance.precipMm,
  'precip_in': instance.precipIn,
  'humidity': instance.humidity,
  'cloud': instance.cloud,
  'feelslike_c': instance.feelslikeC,
  'feelslike_f': instance.feelslikeF,
  'windchill_c': instance.windchillC,
  'windchill_f': instance.windchillF,
  'heatindex_c': instance.heatindexC,
  'heatindex_f': instance.heatindexF,
  'dewpoint_c': instance.dewpointC,
  'dewpoint_f': instance.dewpointF,
  'vis_km': instance.visKm,
  'vis_miles': instance.visMiles,
  'uv': instance.uv,
  'gust_mph': instance.gustMph,
  'gust_kph': instance.gustKph,
  'air_quality': instance.airQuality.toJson(),
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  text: json['text'] as String,
  icon: json['icon'] as String,
  code: (json['code'] as num).toInt(),
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'text': instance.text,
  'icon': instance.icon,
  'code': instance.code,
};

AirQuality _$AirQualityFromJson(Map<String, dynamic> json) => AirQuality(
  co: (json['co'] as num?)?.toDouble(),
  no2: (json['no2'] as num?)?.toDouble(),
  o3: (json['o3'] as num?)?.toDouble(),
  so2: (json['so2'] as num?)?.toDouble(),
  pm25: (json['pm2_5'] as num?)?.toDouble(),
  pm10: (json['pm10'] as num?)?.toDouble(),
  usEpaIndex: (json['us-epa-index'] as num?)?.toInt(),
  gbDefraIndex: (json['gb-defra-index'] as num?)?.toInt(),
);

Map<String, dynamic> _$AirQualityToJson(AirQuality instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm2_5': instance.pm25,
      'pm10': instance.pm10,
      'us-epa-index': instance.usEpaIndex,
      'gb-defra-index': instance.gbDefraIndex,
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
  forecastday:
      (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
  'forecastday': instance.forecastday.map((e) => e.toJson()).toList(),
};

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => ForecastDay(
  date: json['date'] as String,
  dateEpoch: (json['date_epoch'] as num).toInt(),
  day: Day.fromJson(json['day'] as Map<String, dynamic>),
  astro: Astro.fromJson(json['astro'] as Map<String, dynamic>),
  hour:
      (json['hour'] as List<dynamic>)
          .map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'date_epoch': instance.dateEpoch,
      'day': instance.day.toJson(),
      'astro': instance.astro.toJson(),
      'hour': instance.hour.map((e) => e.toJson()).toList(),
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
  maxTempC: (json['maxtemp_c'] as num).toDouble(),
  maxTempF: (json['maxtemp_f'] as num).toDouble(),
  minTempC: (json['mintemp_c'] as num).toDouble(),
  minTempF: (json['mintemp_f'] as num).toDouble(),
  avgTempC: (json['avgtemp_c'] as num).toDouble(),
  avgTempF: (json['avgtemp_f'] as num).toDouble(),
  maxWindMph: (json['maxwind_mph'] as num).toDouble(),
  maxWindKph: (json['maxwind_kph'] as num).toDouble(),
  totalPrecipMm: (json['totalprecip_mm'] as num).toDouble(),
  totalPrecipIn: (json['totalprecip_in'] as num).toDouble(),
  totalSnowCm: (json['totalsnow_cm'] as num).toDouble(),
  avgVisKm: (json['avgvis_km'] as num).toDouble(),
  avgVisMiles: (json['avgvis_miles'] as num).toDouble(),
  avghumidity: (json['avghumidity'] as num).toInt(),
  dailyWillItRain: (json['dailyWillItRain'] as num?)?.toInt(),
  dailyChanceOfRain: (json['dailyChanceOfRain'] as num?)?.toInt(),
  dailyWillItSnow: (json['dailyWillItSnow'] as num?)?.toInt(),
  dailyChanceOfSnow: (json['dailyChanceOfSnow'] as num?)?.toInt(),
  condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
  uv: (json['uv'] as num).toDouble(),
  airQuality: AirQuality.fromJson(json['air_quality'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
  'maxtemp_c': instance.maxTempC,
  'maxtemp_f': instance.maxTempF,
  'mintemp_c': instance.minTempC,
  'mintemp_f': instance.minTempF,
  'avgtemp_c': instance.avgTempC,
  'avgtemp_f': instance.avgTempF,
  'maxwind_mph': instance.maxWindMph,
  'maxwind_kph': instance.maxWindKph,
  'totalprecip_mm': instance.totalPrecipMm,
  'totalprecip_in': instance.totalPrecipIn,
  'totalsnow_cm': instance.totalSnowCm,
  'avgvis_km': instance.avgVisKm,
  'avgvis_miles': instance.avgVisMiles,
  'avghumidity': instance.avghumidity,
  'dailyWillItRain': instance.dailyWillItRain,
  'dailyChanceOfRain': instance.dailyChanceOfRain,
  'dailyWillItSnow': instance.dailyWillItSnow,
  'dailyChanceOfSnow': instance.dailyChanceOfSnow,
  'condition': instance.condition,
  'uv': instance.uv,
  'air_quality': instance.airQuality,
};

Astro _$AstroFromJson(Map<String, dynamic> json) => Astro(
  sunrise: json['sunrise'] as String,
  sunset: json['sunset'] as String,
  moonrise: json['moonrise'] as String,
  moonset: json['moonset'] as String,
  moonPhase: json['moon_phase'] as String,
  moonIllumination: (json['moon_illumination'] as num).toInt(),
  isMoonUp: (json['is_moon_up'] as num).toInt(),
  isSunUp: (json['is_sun_up'] as num).toInt(),
);

Map<String, dynamic> _$AstroToJson(Astro instance) => <String, dynamic>{
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
  'moonrise': instance.moonrise,
  'moonset': instance.moonset,
  'moon_phase': instance.moonPhase,
  'moon_illumination': instance.moonIllumination,
  'is_moon_up': instance.isMoonUp,
  'is_sun_up': instance.isSunUp,
};

Hour _$HourFromJson(Map<String, dynamic> json) => Hour(
  timeEpoch: (json['time_epoch'] as num).toInt(),
  time: json['time'] as String,
  tempC: (json['temp_c'] as num).toDouble(),
  tempF: (json['temp_f'] as num).toDouble(),
  isDay: (json['is_day'] as num).toInt(),
  condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
  windMph: (json['wind_mph'] as num).toDouble(),
  windKph: (json['wind_kph'] as num).toDouble(),
  windDegree: (json['wind_degree'] as num).toInt(),
  windDir: json['wind_dir'] as String,
  pressureMb: (json['pressure_mb'] as num).toInt(),
  pressureIn: (json['pressure_in'] as num).toDouble(),
  precipMm: (json['precip_mm'] as num).toDouble(),
  precipIn: (json['precip_in'] as num).toDouble(),
  snowCm: (json['snow_cm'] as num).toDouble(),
  humidity: (json['humidity'] as num).toInt(),
  cloud: (json['cloud'] as num).toInt(),
  feelslikeC: (json['feelslike_c'] as num).toDouble(),
  feelslikeF: (json['feelslike_f'] as num).toDouble(),
  windchillC: (json['windchill_c'] as num).toDouble(),
  windchillF: (json['windchill_f'] as num).toDouble(),
  heatindexC: (json['heatindex_c'] as num).toDouble(),
  heatindexF: (json['heatindex_f'] as num).toDouble(),
  dewpointC: (json['dewpoint_c'] as num).toDouble(),
  dewpointF: (json['dewpoint_f'] as num).toDouble(),
  willItRain: (json['willItRain'] as num?)?.toInt(),
  chanceOfRain: (json['chanceOfRain'] as num?)?.toInt(),
  willItSnow: (json['willItSnow'] as num?)?.toInt(),
  chanceOfSnow: (json['chanceOfSnow'] as num?)?.toInt(),
  visKm: (json['vis_km'] as num).toDouble(),
  visMiles: (json['vis_miles'] as num).toDouble(),
  gustMph: (json['gust_mph'] as num).toDouble(),
  gustKph: (json['gust_kph'] as num).toDouble(),
  uv: (json['uv'] as num).toDouble(),
  airQuality: AirQuality.fromJson(json['air_quality'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
  'time_epoch': instance.timeEpoch,
  'time': instance.time,
  'temp_c': instance.tempC,
  'temp_f': instance.tempF,
  'is_day': instance.isDay,
  'condition': instance.condition,
  'wind_mph': instance.windMph,
  'wind_kph': instance.windKph,
  'wind_degree': instance.windDegree,
  'wind_dir': instance.windDir,
  'pressure_mb': instance.pressureMb,
  'pressure_in': instance.pressureIn,
  'precip_mm': instance.precipMm,
  'precip_in': instance.precipIn,
  'snow_cm': instance.snowCm,
  'humidity': instance.humidity,
  'cloud': instance.cloud,
  'feelslike_c': instance.feelslikeC,
  'feelslike_f': instance.feelslikeF,
  'windchill_c': instance.windchillC,
  'windchill_f': instance.windchillF,
  'heatindex_c': instance.heatindexC,
  'heatindex_f': instance.heatindexF,
  'dewpoint_c': instance.dewpointC,
  'dewpoint_f': instance.dewpointF,
  'willItRain': instance.willItRain,
  'chanceOfRain': instance.chanceOfRain,
  'willItSnow': instance.willItSnow,
  'chanceOfSnow': instance.chanceOfSnow,
  'vis_km': instance.visKm,
  'vis_miles': instance.visMiles,
  'gust_mph': instance.gustMph,
  'gust_kph': instance.gustKph,
  'uv': instance.uv,
  'air_quality': instance.airQuality,
};

Alerts _$AlertsFromJson(Map<String, dynamic> json) => Alerts(
  alert:
      (json['alert'] as List<dynamic>)
          .map((e) => Alert.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AlertsToJson(Alerts instance) => <String, dynamic>{
  'alert': instance.alert,
};

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
  headline: json['headline'] as String,
  effective: json['effective'] as String,
  expires: json['expires'] as String,
  event: json['event'] as String,
  desc: json['desc'] as String,
);

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
  'headline': instance.headline,
  'effective': instance.effective,
  'expires': instance.expires,
  'event': instance.event,
  'desc': instance.desc,
};
