// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bus _$BusFromJson(Map<String, dynamic> json) {
  return _Bus.fromJson(json);
}

/// @nodoc
mixin _$Bus {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_number')
  String get registrationNumber => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'fuel_type')
  BusFuelType? get fuelType => throw _privateConstructorUsedError;
  @JsonKey(name: 'emission_standard')
  BusEmissionStandard? get emissionStandard =>
      throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  BusStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusCopyWith<Bus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusCopyWith<$Res> {
  factory $BusCopyWith(Bus value, $Res Function(Bus) then) =
      _$BusCopyWithImpl<$Res, Bus>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'registration_number') String registrationNumber,
      String? model,
      @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
      int? capacity,
      BusStatus status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$BusCopyWithImpl<$Res, $Val extends Bus> implements $BusCopyWith<$Res> {
  _$BusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? registrationNumber = null,
    Object? model = freezed,
    Object? fuelType = freezed,
    Object? emissionStandard = freezed,
    Object? capacity = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as BusFuelType?,
      emissionStandard: freezed == emissionStandard
          ? _value.emissionStandard
          : emissionStandard // ignore: cast_nullable_to_non_nullable
              as BusEmissionStandard?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusImplCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$$BusImplCopyWith(_$BusImpl value, $Res Function(_$BusImpl) then) =
      __$$BusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'registration_number') String registrationNumber,
      String? model,
      @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
      int? capacity,
      BusStatus status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$BusImplCopyWithImpl<$Res> extends _$BusCopyWithImpl<$Res, _$BusImpl>
    implements _$$BusImplCopyWith<$Res> {
  __$$BusImplCopyWithImpl(_$BusImpl _value, $Res Function(_$BusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? registrationNumber = null,
    Object? model = freezed,
    Object? fuelType = freezed,
    Object? emissionStandard = freezed,
    Object? capacity = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as BusFuelType?,
      emissionStandard: freezed == emissionStandard
          ? _value.emissionStandard
          : emissionStandard // ignore: cast_nullable_to_non_nullable
              as BusEmissionStandard?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusImpl implements _Bus {
  const _$BusImpl(
      {required this.id,
      @JsonKey(name: 'organization_id') required this.organizationId,
      @JsonKey(name: 'registration_number') required this.registrationNumber,
      this.model,
      @JsonKey(name: 'fuel_type') this.fuelType,
      @JsonKey(name: 'emission_standard') this.emissionStandard,
      this.capacity,
      required this.status,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BusImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  @JsonKey(name: 'registration_number')
  final String registrationNumber;
  @override
  final String? model;
  @override
  @JsonKey(name: 'fuel_type')
  final BusFuelType? fuelType;
  @override
  @JsonKey(name: 'emission_standard')
  final BusEmissionStandard? emissionStandard;
  @override
  final int? capacity;
  @override
  final BusStatus status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'Bus(id: $id, organizationId: $organizationId, registrationNumber: $registrationNumber, model: $model, fuelType: $fuelType, emissionStandard: $emissionStandard, capacity: $capacity, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.emissionStandard, emissionStandard) ||
                other.emissionStandard == emissionStandard) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      organizationId,
      registrationNumber,
      model,
      fuelType,
      emissionStandard,
      capacity,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusImplCopyWith<_$BusImpl> get copyWith =>
      __$$BusImplCopyWithImpl<_$BusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusImplToJson(
      this,
    );
  }
}

abstract class _Bus implements Bus {
  const factory _Bus(
      {required final String id,
      @JsonKey(name: 'organization_id') required final String organizationId,
      @JsonKey(name: 'registration_number')
      required final String registrationNumber,
      final String? model,
      @JsonKey(name: 'fuel_type') final BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard')
      final BusEmissionStandard? emissionStandard,
      final int? capacity,
      required final BusStatus status,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$BusImpl;

  factory _Bus.fromJson(Map<String, dynamic> json) = _$BusImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  @JsonKey(name: 'registration_number')
  String get registrationNumber;
  @override
  String? get model;
  @override
  @JsonKey(name: 'fuel_type')
  BusFuelType? get fuelType;
  @override
  @JsonKey(name: 'emission_standard')
  BusEmissionStandard? get emissionStandard;
  @override
  int? get capacity;
  @override
  BusStatus get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BusImplCopyWith<_$BusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateBusRequest _$CreateBusRequestFromJson(Map<String, dynamic> json) {
  return _CreateBusRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBusRequest {
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_number')
  String get registrationNumber => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'fuel_type')
  BusFuelType? get fuelType => throw _privateConstructorUsedError;
  @JsonKey(name: 'emission_standard')
  BusEmissionStandard? get emissionStandard =>
      throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  BusStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBusRequestCopyWith<CreateBusRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBusRequestCopyWith<$Res> {
  factory $CreateBusRequestCopyWith(
          CreateBusRequest value, $Res Function(CreateBusRequest) then) =
      _$CreateBusRequestCopyWithImpl<$Res, CreateBusRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'registration_number') String registrationNumber,
      String? model,
      @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
      int? capacity,
      BusStatus? status});
}

/// @nodoc
class _$CreateBusRequestCopyWithImpl<$Res, $Val extends CreateBusRequest>
    implements $CreateBusRequestCopyWith<$Res> {
  _$CreateBusRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? registrationNumber = null,
    Object? model = freezed,
    Object? fuelType = freezed,
    Object? emissionStandard = freezed,
    Object? capacity = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as BusFuelType?,
      emissionStandard: freezed == emissionStandard
          ? _value.emissionStandard
          : emissionStandard // ignore: cast_nullable_to_non_nullable
              as BusEmissionStandard?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBusRequestImplCopyWith<$Res>
    implements $CreateBusRequestCopyWith<$Res> {
  factory _$$CreateBusRequestImplCopyWith(_$CreateBusRequestImpl value,
          $Res Function(_$CreateBusRequestImpl) then) =
      __$$CreateBusRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'registration_number') String registrationNumber,
      String? model,
      @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
      int? capacity,
      BusStatus? status});
}

/// @nodoc
class __$$CreateBusRequestImplCopyWithImpl<$Res>
    extends _$CreateBusRequestCopyWithImpl<$Res, _$CreateBusRequestImpl>
    implements _$$CreateBusRequestImplCopyWith<$Res> {
  __$$CreateBusRequestImplCopyWithImpl(_$CreateBusRequestImpl _value,
      $Res Function(_$CreateBusRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? registrationNumber = null,
    Object? model = freezed,
    Object? fuelType = freezed,
    Object? emissionStandard = freezed,
    Object? capacity = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CreateBusRequestImpl(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as BusFuelType?,
      emissionStandard: freezed == emissionStandard
          ? _value.emissionStandard
          : emissionStandard // ignore: cast_nullable_to_non_nullable
              as BusEmissionStandard?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBusRequestImpl implements _CreateBusRequest {
  const _$CreateBusRequestImpl(
      {@JsonKey(name: 'organization_id') required this.organizationId,
      @JsonKey(name: 'registration_number') required this.registrationNumber,
      this.model,
      @JsonKey(name: 'fuel_type') this.fuelType,
      @JsonKey(name: 'emission_standard') this.emissionStandard,
      this.capacity,
      this.status});

  factory _$CreateBusRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBusRequestImplFromJson(json);

  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  @JsonKey(name: 'registration_number')
  final String registrationNumber;
  @override
  final String? model;
  @override
  @JsonKey(name: 'fuel_type')
  final BusFuelType? fuelType;
  @override
  @JsonKey(name: 'emission_standard')
  final BusEmissionStandard? emissionStandard;
  @override
  final int? capacity;
  @override
  final BusStatus? status;

  @override
  String toString() {
    return 'CreateBusRequest(organizationId: $organizationId, registrationNumber: $registrationNumber, model: $model, fuelType: $fuelType, emissionStandard: $emissionStandard, capacity: $capacity, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBusRequestImpl &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.emissionStandard, emissionStandard) ||
                other.emissionStandard == emissionStandard) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, organizationId,
      registrationNumber, model, fuelType, emissionStandard, capacity, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBusRequestImplCopyWith<_$CreateBusRequestImpl> get copyWith =>
      __$$CreateBusRequestImplCopyWithImpl<_$CreateBusRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBusRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateBusRequest implements CreateBusRequest {
  const factory _CreateBusRequest(
      {@JsonKey(name: 'organization_id') required final String organizationId,
      @JsonKey(name: 'registration_number')
      required final String registrationNumber,
      final String? model,
      @JsonKey(name: 'fuel_type') final BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard')
      final BusEmissionStandard? emissionStandard,
      final int? capacity,
      final BusStatus? status}) = _$CreateBusRequestImpl;

  factory _CreateBusRequest.fromJson(Map<String, dynamic> json) =
      _$CreateBusRequestImpl.fromJson;

  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  @JsonKey(name: 'registration_number')
  String get registrationNumber;
  @override
  String? get model;
  @override
  @JsonKey(name: 'fuel_type')
  BusFuelType? get fuelType;
  @override
  @JsonKey(name: 'emission_standard')
  BusEmissionStandard? get emissionStandard;
  @override
  int? get capacity;
  @override
  BusStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateBusRequestImplCopyWith<_$CreateBusRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateBusRequest _$UpdateBusRequestFromJson(Map<String, dynamic> json) {
  return _UpdateBusRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateBusRequest {
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'fuel_type')
  BusFuelType? get fuelType => throw _privateConstructorUsedError;
  @JsonKey(name: 'emission_standard')
  BusEmissionStandard? get emissionStandard =>
      throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  BusStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateBusRequestCopyWith<UpdateBusRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBusRequestCopyWith<$Res> {
  factory $UpdateBusRequestCopyWith(
          UpdateBusRequest value, $Res Function(UpdateBusRequest) then) =
      _$UpdateBusRequestCopyWithImpl<$Res, UpdateBusRequest>;
  @useResult
  $Res call(
      {String? model,
      @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
      int? capacity,
      BusStatus? status});
}

/// @nodoc
class _$UpdateBusRequestCopyWithImpl<$Res, $Val extends UpdateBusRequest>
    implements $UpdateBusRequestCopyWith<$Res> {
  _$UpdateBusRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? fuelType = freezed,
    Object? emissionStandard = freezed,
    Object? capacity = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as BusFuelType?,
      emissionStandard: freezed == emissionStandard
          ? _value.emissionStandard
          : emissionStandard // ignore: cast_nullable_to_non_nullable
              as BusEmissionStandard?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateBusRequestImplCopyWith<$Res>
    implements $UpdateBusRequestCopyWith<$Res> {
  factory _$$UpdateBusRequestImplCopyWith(_$UpdateBusRequestImpl value,
          $Res Function(_$UpdateBusRequestImpl) then) =
      __$$UpdateBusRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? model,
      @JsonKey(name: 'fuel_type') BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard') BusEmissionStandard? emissionStandard,
      int? capacity,
      BusStatus? status});
}

/// @nodoc
class __$$UpdateBusRequestImplCopyWithImpl<$Res>
    extends _$UpdateBusRequestCopyWithImpl<$Res, _$UpdateBusRequestImpl>
    implements _$$UpdateBusRequestImplCopyWith<$Res> {
  __$$UpdateBusRequestImplCopyWithImpl(_$UpdateBusRequestImpl _value,
      $Res Function(_$UpdateBusRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? fuelType = freezed,
    Object? emissionStandard = freezed,
    Object? capacity = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UpdateBusRequestImpl(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as BusFuelType?,
      emissionStandard: freezed == emissionStandard
          ? _value.emissionStandard
          : emissionStandard // ignore: cast_nullable_to_non_nullable
              as BusEmissionStandard?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateBusRequestImpl implements _UpdateBusRequest {
  const _$UpdateBusRequestImpl(
      {this.model,
      @JsonKey(name: 'fuel_type') this.fuelType,
      @JsonKey(name: 'emission_standard') this.emissionStandard,
      this.capacity,
      this.status});

  factory _$UpdateBusRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateBusRequestImplFromJson(json);

  @override
  final String? model;
  @override
  @JsonKey(name: 'fuel_type')
  final BusFuelType? fuelType;
  @override
  @JsonKey(name: 'emission_standard')
  final BusEmissionStandard? emissionStandard;
  @override
  final int? capacity;
  @override
  final BusStatus? status;

  @override
  String toString() {
    return 'UpdateBusRequest(model: $model, fuelType: $fuelType, emissionStandard: $emissionStandard, capacity: $capacity, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBusRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.emissionStandard, emissionStandard) ||
                other.emissionStandard == emissionStandard) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, model, fuelType, emissionStandard, capacity, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBusRequestImplCopyWith<_$UpdateBusRequestImpl> get copyWith =>
      __$$UpdateBusRequestImplCopyWithImpl<_$UpdateBusRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateBusRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateBusRequest implements UpdateBusRequest {
  const factory _UpdateBusRequest(
      {final String? model,
      @JsonKey(name: 'fuel_type') final BusFuelType? fuelType,
      @JsonKey(name: 'emission_standard')
      final BusEmissionStandard? emissionStandard,
      final int? capacity,
      final BusStatus? status}) = _$UpdateBusRequestImpl;

  factory _UpdateBusRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateBusRequestImpl.fromJson;

  @override
  String? get model;
  @override
  @JsonKey(name: 'fuel_type')
  BusFuelType? get fuelType;
  @override
  @JsonKey(name: 'emission_standard')
  BusEmissionStandard? get emissionStandard;
  @override
  int? get capacity;
  @override
  BusStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$UpdateBusRequestImplCopyWith<_$UpdateBusRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
