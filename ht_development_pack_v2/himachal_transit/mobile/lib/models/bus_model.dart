import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_model.freezed.dart';
part 'bus_model.g.dart';

enum BusFuelType {
  @JsonValue('Diesel')
  diesel,
  @JsonValue('CNG')
  cng,
  @JsonValue('Electric')
  electric,
  @JsonValue('Hybrid')
  hybrid,
}

enum BusEmissionStandard {
  @JsonValue('BS-III')
  bsIII,
  @JsonValue('BS-IV')
  bsIV,
  @JsonValue('BS-VI')
  bsVI,
  @JsonValue('Electric')
  electric,
  @JsonValue('Unknown')
  unknown,
}

enum BusStatus {
  @JsonValue('IN_SERVICE')
  inService,
  @JsonValue('MAINTENANCE')
  maintenance,
  @JsonValue('OUT_OF_SERVICE')
  outOfService,
  @JsonValue('RETIRED')
  retired,
}

@freezed
class Bus with _$Bus {
  const factory Bus({
    required String id,
    @JsonKey(name: 'organization_id') required String organizationId,
    @JsonKey(name: 'registration_number') required String registrationNumber,
    String? model,
    @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
    @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
    int? capacity,
    required BusStatus status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Bus;

  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);
}

@freezed
class CreateBusRequest with _$CreateBusRequest {
  const factory CreateBusRequest({
    @JsonKey(name: 'organization_id') required String organizationId,
    @JsonKey(name: 'registration_number') required String registrationNumber,
    String? model,
    @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
    @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
    int? capacity,
    BusStatus? status,
  }) = _CreateBusRequest;

  factory CreateBusRequest.fromJson(Map<String, dynamic> json) => _$CreateBusRequestFromJson(json);
}

@freezed
class UpdateBusRequest with _$UpdateBusRequest {
  const factory UpdateBusRequest({
    String? model,
    @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
    @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
    int? capacity,
    BusStatus? status,
  }) = _UpdateBusRequest;

  factory UpdateBusRequest.fromJson(Map<String, dynamic> json) => _$UpdateBusRequestFromJson(json);
}