// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusImpl _$$BusImplFromJson(Map<String, dynamic> json) => _$BusImpl(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      registrationNumber: json['registration_number'] as String,
      model: json['model'] as String?,
      fuelType: $enumDecodeNullable(_$BusFuelTypeEnumMap, json['fuel_type']),
      emissionStandard: $enumDecodeNullable(
          _$BusEmissionStandardEnumMap, json['emission_standard']),
      capacity: (json['capacity'] as num?)?.toInt(),
      status: $enumDecode(_$BusStatusEnumMap, json['status']),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$BusImplToJson(_$BusImpl instance) => <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'registration_number': instance.registrationNumber,
      'model': instance.model,
      'fuel_type': _$BusFuelTypeEnumMap[instance.fuelType],
      'emission_standard':
          _$BusEmissionStandardEnumMap[instance.emissionStandard],
      'capacity': instance.capacity,
      'status': _$BusStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$BusFuelTypeEnumMap = {
  BusFuelType.diesel: 'Diesel',
  BusFuelType.cng: 'CNG',
  BusFuelType.electric: 'Electric',
  BusFuelType.hybrid: 'Hybrid',
};

const _$BusEmissionStandardEnumMap = {
  BusEmissionStandard.bsIII: 'BS-III',
  BusEmissionStandard.bsIV: 'BS-IV',
  BusEmissionStandard.bsVI: 'BS-VI',
  BusEmissionStandard.electric: 'Electric',
  BusEmissionStandard.unknown: 'Unknown',
};

const _$BusStatusEnumMap = {
  BusStatus.inService: 'IN_SERVICE',
  BusStatus.maintenance: 'MAINTENANCE',
  BusStatus.outOfService: 'OUT_OF_SERVICE',
  BusStatus.retired: 'RETIRED',
};

_$CreateBusRequestImpl _$$CreateBusRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBusRequestImpl(
      organizationId: json['organization_id'] as String,
      registrationNumber: json['registration_number'] as String,
      model: json['model'] as String?,
      fuelType: $enumDecodeNullable(_$BusFuelTypeEnumMap, json['fuel_type']),
      emissionStandard: $enumDecodeNullable(
          _$BusEmissionStandardEnumMap, json['emission_standard']),
      capacity: (json['capacity'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$BusStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$CreateBusRequestImplToJson(
        _$CreateBusRequestImpl instance) =>
    <String, dynamic>{
      'organization_id': instance.organizationId,
      'registration_number': instance.registrationNumber,
      'model': instance.model,
      'fuel_type': _$BusFuelTypeEnumMap[instance.fuelType],
      'emission_standard':
          _$BusEmissionStandardEnumMap[instance.emissionStandard],
      'capacity': instance.capacity,
      'status': _$BusStatusEnumMap[instance.status],
    };

_$UpdateBusRequestImpl _$$UpdateBusRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateBusRequestImpl(
      model: json['model'] as String?,
      fuelType: $enumDecodeNullable(_$BusFuelTypeEnumMap, json['fuel_type']),
      emissionStandard: $enumDecodeNullable(
          _$BusEmissionStandardEnumMap, json['emission_standard']),
      capacity: (json['capacity'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$BusStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UpdateBusRequestImplToJson(
        _$UpdateBusRequestImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'fuel_type': _$BusFuelTypeEnumMap[instance.fuelType],
      'emission_standard':
          _$BusEmissionStandardEnumMap[instance.emissionStandard],
      'capacity': instance.capacity,
      'status': _$BusStatusEnumMap[instance.status],
    };
