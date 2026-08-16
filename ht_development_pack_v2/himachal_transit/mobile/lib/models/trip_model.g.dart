// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as String,
      driverId: json['driver_id'] as String?,
      busId: json['bus_id'] as String?,
      routeId: json['route_id'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      status: json['status'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      bus: _busFromJson(json['bus'] as Map<String, dynamic>?),
      route: _routeFromJson(json['route'] as Map<String, dynamic>?),
      driver: _driverFromJson(json['driver'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'bus_id': instance.busId,
      'route_id': instance.routeId,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'bus': instance.bus,
      'route': instance.route,
      'driver': instance.driver,
    };

_$CreateTripRequestImpl _$$CreateTripRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTripRequestImpl(
      driverId: json['driver_id'] as String,
      busId: json['bus_id'] as String,
      routeId: json['route_id'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$CreateTripRequestImplToJson(
        _$CreateTripRequestImpl instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'bus_id': instance.busId,
      'route_id': instance.routeId,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'status': instance.status,
    };

_$UpdateTripRequestImpl _$$UpdateTripRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateTripRequestImpl(
      driverId: json['driver_id'] as String?,
      busId: json['bus_id'] as String?,
      routeId: json['route_id'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$UpdateTripRequestImplToJson(
        _$UpdateTripRequestImpl instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'bus_id': instance.busId,
      'route_id': instance.routeId,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'status': instance.status,
    };

_$GpsLocationImpl _$$GpsLocationImplFromJson(Map<String, dynamic> json) =>
    _$GpsLocationImpl(
      id: json['id'] as String,
      tripId: json['trip_id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      recordedAt: json['recorded_at'] as String,
      geom: json['geom'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$GpsLocationImplToJson(_$GpsLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'speed': instance.speed,
      'heading': instance.heading,
      'accuracy': instance.accuracy,
      'recorded_at': instance.recordedAt,
      'geom': instance.geom,
      'created_at': instance.createdAt,
    };

_$CreateGpsLocationRequestImpl _$$CreateGpsLocationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateGpsLocationRequestImpl(
      tripId: json['trip_id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      recordedAt: json['recorded_at'] as String?,
    );

Map<String, dynamic> _$$CreateGpsLocationRequestImplToJson(
        _$CreateGpsLocationRequestImpl instance) =>
    <String, dynamic>{
      'trip_id': instance.tripId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'speed': instance.speed,
      'heading': instance.heading,
      'accuracy': instance.accuracy,
      'recorded_at': instance.recordedAt,
    };
