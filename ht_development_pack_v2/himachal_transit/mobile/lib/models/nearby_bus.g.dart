// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbyBusImpl _$$NearbyBusImplFromJson(Map<String, dynamic> json) =>
    _$NearbyBusImpl(
      bus: Bus.fromJson(json['bus'] as Map<String, dynamic>),
      route: json['route'] == null
          ? null
          : Route.fromJson(json['route'] as Map<String, dynamic>),
      trip: json['trip'] == null
          ? null
          : Trip.fromJson(json['trip'] as Map<String, dynamic>),
      distance: (json['distance'] as num).toDouble(),
      lastLocation: json['lastLocation'] == null
          ? null
          : NearbyBusGpsLocation.fromJson(
              json['lastLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NearbyBusImplToJson(_$NearbyBusImpl instance) =>
    <String, dynamic>{
      'bus': instance.bus,
      'route': instance.route,
      'trip': instance.trip,
      'distance': instance.distance,
      'lastLocation': instance.lastLocation,
    };

_$NearbyBusGpsLocationImpl _$$NearbyBusGpsLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbyBusGpsLocationImpl(
      id: json['id'] as String,
      tripId: json['tripId'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      recordedAt: (json['recordedAt'] as num).toInt(),
    );

Map<String, dynamic> _$$NearbyBusGpsLocationImplToJson(
        _$NearbyBusGpsLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tripId': instance.tripId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'speed': instance.speed,
      'heading': instance.heading,
      'accuracy': instance.accuracy,
      'recordedAt': instance.recordedAt,
    };
