// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignmentImpl _$$AssignmentImplFromJson(Map<String, dynamic> json) =>
    _$AssignmentImpl(
      id: json['id'] as String,
      driverId: json['driver_id'] as String,
      busId: json['bus_id'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      status: json['status'] as String,
      createdAt: json['created_at'] as String?,
      driver: _driverFromJson(json['driver'] as Map<String, dynamic>?),
      bus: _busFromJson(json['bus'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$AssignmentImplToJson(_$AssignmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'bus_id': instance.busId,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'status': instance.status,
      'created_at': instance.createdAt,
      'driver': instance.driver,
      'bus': instance.bus,
    };

_$CreateAssignmentRequestImpl _$$CreateAssignmentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAssignmentRequestImpl(
      driverId: json['driver_id'] as String,
      busId: json['bus_id'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$CreateAssignmentRequestImplToJson(
        _$CreateAssignmentRequestImpl instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'bus_id': instance.busId,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'status': instance.status,
    };
