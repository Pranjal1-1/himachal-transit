// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverImpl _$$DriverImplFromJson(Map<String, dynamic> json) => _$DriverImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      organizationId: json['organization_id'] as String?,
      employeeId: json['employee_id'] as String?,
      verificationStatus: json['verification_status'] as String,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DriverImplToJson(_$DriverImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'organization_id': instance.organizationId,
      'employee_id': instance.employeeId,
      'verification_status': instance.verificationStatus,
      'status': instance.status,
      'created_at': instance.createdAt,
      'user': instance.user,
    };

_$CreateDriverRequestImpl _$$CreateDriverRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateDriverRequestImpl(
      userId: json['user_id'] as String,
      organizationId: json['organization_id'] as String,
      employeeId: json['employee_id'] as String,
      verificationStatus: json['verification_status'] as String?,
    );

Map<String, dynamic> _$$CreateDriverRequestImplToJson(
        _$CreateDriverRequestImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'organization_id': instance.organizationId,
      'employee_id': instance.employeeId,
      'verification_status': instance.verificationStatus,
    };
