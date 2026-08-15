// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationImpl _$$OrganizationImplFromJson(Map<String, dynamic> json) =>
    _$OrganizationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$OrganizationImplToJson(_$OrganizationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'created_at': instance.createdAt,
    };

_$CreateOrganizationRequestImpl _$$CreateOrganizationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrganizationRequestImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$CreateOrganizationRequestImplToJson(
        _$CreateOrganizationRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };
