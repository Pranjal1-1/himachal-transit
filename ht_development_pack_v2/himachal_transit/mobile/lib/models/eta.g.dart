// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EtaResultImpl _$$EtaResultImplFromJson(Map<String, dynamic> json) =>
    _$EtaResultImpl(
      distanceToNextStopKm: (json['distanceToNextStopKm'] as num).toDouble(),
      etaMinutes: (json['etaMinutes'] as num).toInt(),
      currentSpeedKmh: (json['currentSpeedKmh'] as num).toDouble(),
      nextStop: json['nextStop'] == null
          ? null
          : EtaNextStop.fromJson(json['nextStop'] as Map<String, dynamic>),
      remainingStops: (json['remainingStops'] as num).toInt(),
      totalRemainingDistanceKm:
          (json['totalRemainingDistanceKm'] as num).toDouble(),
      etaToDestinationMinutes: (json['etaToDestinationMinutes'] as num).toInt(),
      currentRouteIndex: (json['currentRouteIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$EtaResultImplToJson(_$EtaResultImpl instance) =>
    <String, dynamic>{
      'distanceToNextStopKm': instance.distanceToNextStopKm,
      'etaMinutes': instance.etaMinutes,
      'currentSpeedKmh': instance.currentSpeedKmh,
      'nextStop': instance.nextStop,
      'remainingStops': instance.remainingStops,
      'totalRemainingDistanceKm': instance.totalRemainingDistanceKm,
      'etaToDestinationMinutes': instance.etaToDestinationMinutes,
      'currentRouteIndex': instance.currentRouteIndex,
    };

_$EtaNextStopImpl _$$EtaNextStopImplFromJson(Map<String, dynamic> json) =>
    _$EtaNextStopImpl(
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      stopOrder: (json['stopOrder'] as num).toInt(),
    );

Map<String, dynamic> _$$EtaNextStopImplToJson(_$EtaNextStopImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'stopOrder': instance.stopOrder,
    };
