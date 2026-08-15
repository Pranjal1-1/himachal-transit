// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteImpl _$$RouteImplFromJson(Map<String, dynamic> json) => _$RouteImpl(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      geometry: json['geometry'] as String?,
      status: $enumDecode(_$RouteStatusEnumMap, json['status']),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$RouteImplToJson(_$RouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'name': instance.name,
      'origin': instance.origin,
      'destination': instance.destination,
      'geometry': instance.geometry,
      'status': _$RouteStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$RouteStatusEnumMap = {
  RouteStatus.active: 'ACTIVE',
  RouteStatus.inactive: 'INACTIVE',
};

_$RouteStopImpl _$$RouteStopImplFromJson(Map<String, dynamic> json) =>
    _$RouteStopImpl(
      id: json['id'] as String,
      routeId: json['route_id'] as String,
      stopId: json['stop_id'] as String,
      stopOrder: (json['stop_order'] as num).toInt(),
      createdAt: json['created_at'] as String?,
      stop: _stopFromJson(json['stop'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$RouteStopImplToJson(_$RouteStopImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route_id': instance.routeId,
      'stop_id': instance.stopId,
      'stop_order': instance.stopOrder,
      'created_at': instance.createdAt,
      'stop': instance.stop,
    };

_$CreateRouteRequestImpl _$$CreateRouteRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRouteRequestImpl(
      organizationId: json['organization_id'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      geometry: json['geometry'] as String?,
      status: $enumDecodeNullable(_$RouteStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$CreateRouteRequestImplToJson(
        _$CreateRouteRequestImpl instance) =>
    <String, dynamic>{
      'organization_id': instance.organizationId,
      'name': instance.name,
      'origin': instance.origin,
      'destination': instance.destination,
      'geometry': instance.geometry,
      'status': _$RouteStatusEnumMap[instance.status],
    };

_$UpdateRouteRequestImpl _$$UpdateRouteRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateRouteRequestImpl(
      name: json['name'] as String?,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      geometry: json['geometry'] as String?,
      status: $enumDecodeNullable(_$RouteStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UpdateRouteRequestImplToJson(
        _$UpdateRouteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'origin': instance.origin,
      'destination': instance.destination,
      'geometry': instance.geometry,
      'status': _$RouteStatusEnumMap[instance.status],
    };

_$CreateRouteStopRequestImpl _$$CreateRouteStopRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRouteStopRequestImpl(
      routeId: json['route_id'] as String,
      stopId: json['stop_id'] as String,
      stopOrder: (json['stop_order'] as num).toInt(),
    );

Map<String, dynamic> _$$CreateRouteStopRequestImplToJson(
        _$CreateRouteStopRequestImpl instance) =>
    <String, dynamic>{
      'route_id': instance.routeId,
      'stop_id': instance.stopId,
      'stop_order': instance.stopOrder,
    };
