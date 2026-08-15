// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StopImpl _$$StopImplFromJson(Map<String, dynamic> json) => _$StopImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      status: $enumDecode(_$StopStatusEnumMap, json['status']),
      geom: json['geom'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$StopImplToJson(_$StopImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'status': _$StopStatusEnumMap[instance.status]!,
      'geom': instance.geom,
      'created_at': instance.createdAt,
    };

const _$StopStatusEnumMap = {
  StopStatus.active: 'ACTIVE',
  StopStatus.inactive: 'INACTIVE',
  StopStatus.maintenance: 'MAINTENANCE',
};

_$CreateStopRequestImpl _$$CreateStopRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateStopRequestImpl(
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String?,
      status: $enumDecodeNullable(_$StopStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$CreateStopRequestImplToJson(
        _$CreateStopRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'status': _$StopStatusEnumMap[instance.status],
    };

_$UpdateStopRequestImpl _$$UpdateStopRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateStopRequestImpl(
      name: json['name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      status: $enumDecodeNullable(_$StopStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UpdateStopRequestImplToJson(
        _$UpdateStopRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'status': _$StopStatusEnumMap[instance.status],
    };
