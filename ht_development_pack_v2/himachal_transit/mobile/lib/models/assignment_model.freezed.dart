// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return _Assignment.fromJson(json);
}

/// @nodoc
mixin _$Assignment {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_id')
  String get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_id')
  String get busId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError; // Nested data
  @JsonKey(name: 'driver', fromJson: _driverFromJson)
  Driver? get driver => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus', fromJson: _busFromJson)
  Bus? get bus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignmentCopyWith<Assignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentCopyWith<$Res> {
  factory $AssignmentCopyWith(
          Assignment value, $Res Function(Assignment) then) =
      _$AssignmentCopyWithImpl<$Res, Assignment>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'bus_id') String busId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'driver', fromJson: _driverFromJson) Driver? driver,
      @JsonKey(name: 'bus', fromJson: _busFromJson) Bus? bus});

  $DriverCopyWith<$Res>? get driver;
  $BusCopyWith<$Res>? get bus;
}

/// @nodoc
class _$AssignmentCopyWithImpl<$Res, $Val extends Assignment>
    implements $AssignmentCopyWith<$Res> {
  _$AssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? busId = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? driver = freezed,
    Object? bus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
      bus: freezed == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverCopyWith<$Res>? get driver {
    if (_value.driver == null) {
      return null;
    }

    return $DriverCopyWith<$Res>(_value.driver!, (value) {
      return _then(_value.copyWith(driver: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BusCopyWith<$Res>? get bus {
    if (_value.bus == null) {
      return null;
    }

    return $BusCopyWith<$Res>(_value.bus!, (value) {
      return _then(_value.copyWith(bus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssignmentImplCopyWith<$Res>
    implements $AssignmentCopyWith<$Res> {
  factory _$$AssignmentImplCopyWith(
          _$AssignmentImpl value, $Res Function(_$AssignmentImpl) then) =
      __$$AssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'bus_id') String busId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'driver', fromJson: _driverFromJson) Driver? driver,
      @JsonKey(name: 'bus', fromJson: _busFromJson) Bus? bus});

  @override
  $DriverCopyWith<$Res>? get driver;
  @override
  $BusCopyWith<$Res>? get bus;
}

/// @nodoc
class __$$AssignmentImplCopyWithImpl<$Res>
    extends _$AssignmentCopyWithImpl<$Res, _$AssignmentImpl>
    implements _$$AssignmentImplCopyWith<$Res> {
  __$$AssignmentImplCopyWithImpl(
      _$AssignmentImpl _value, $Res Function(_$AssignmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? busId = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? driver = freezed,
    Object? bus = freezed,
  }) {
    return _then(_$AssignmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
      bus: freezed == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignmentImpl implements _Assignment {
  const _$AssignmentImpl(
      {required this.id,
      @JsonKey(name: 'driver_id') required this.driverId,
      @JsonKey(name: 'bus_id') required this.busId,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      required this.status,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'driver', fromJson: _driverFromJson) this.driver,
      @JsonKey(name: 'bus', fromJson: _busFromJson) this.bus});

  factory _$AssignmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignmentImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'driver_id')
  final String driverId;
  @override
  @JsonKey(name: 'bus_id')
  final String busId;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
// Nested data
  @override
  @JsonKey(name: 'driver', fromJson: _driverFromJson)
  final Driver? driver;
  @override
  @JsonKey(name: 'bus', fromJson: _busFromJson)
  final Bus? bus;

  @override
  String toString() {
    return 'Assignment(id: $id, driverId: $driverId, busId: $busId, startTime: $startTime, endTime: $endTime, status: $status, createdAt: $createdAt, driver: $driver, bus: $bus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.bus, bus) || other.bus == bus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, driverId, busId, startTime,
      endTime, status, createdAt, driver, bus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentImplCopyWith<_$AssignmentImpl> get copyWith =>
      __$$AssignmentImplCopyWithImpl<_$AssignmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignmentImplToJson(
      this,
    );
  }
}

abstract class _Assignment implements Assignment {
  const factory _Assignment(
      {required final String id,
      @JsonKey(name: 'driver_id') required final String driverId,
      @JsonKey(name: 'bus_id') required final String busId,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      required final String status,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'driver', fromJson: _driverFromJson) final Driver? driver,
      @JsonKey(name: 'bus', fromJson: _busFromJson)
      final Bus? bus}) = _$AssignmentImpl;

  factory _Assignment.fromJson(Map<String, dynamic> json) =
      _$AssignmentImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'driver_id')
  String get driverId;
  @override
  @JsonKey(name: 'bus_id')
  String get busId;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override // Nested data
  @JsonKey(name: 'driver', fromJson: _driverFromJson)
  Driver? get driver;
  @override
  @JsonKey(name: 'bus', fromJson: _busFromJson)
  Bus? get bus;
  @override
  @JsonKey(ignore: true)
  _$$AssignmentImplCopyWith<_$AssignmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateAssignmentRequest _$CreateAssignmentRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateAssignmentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateAssignmentRequest {
  @JsonKey(name: 'driver_id')
  String get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_id')
  String get busId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateAssignmentRequestCopyWith<CreateAssignmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAssignmentRequestCopyWith<$Res> {
  factory $CreateAssignmentRequestCopyWith(CreateAssignmentRequest value,
          $Res Function(CreateAssignmentRequest) then) =
      _$CreateAssignmentRequestCopyWithImpl<$Res, CreateAssignmentRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'bus_id') String busId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String? status});
}

/// @nodoc
class _$CreateAssignmentRequestCopyWithImpl<$Res,
        $Val extends CreateAssignmentRequest>
    implements $CreateAssignmentRequestCopyWith<$Res> {
  _$CreateAssignmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? busId = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAssignmentRequestImplCopyWith<$Res>
    implements $CreateAssignmentRequestCopyWith<$Res> {
  factory _$$CreateAssignmentRequestImplCopyWith(
          _$CreateAssignmentRequestImpl value,
          $Res Function(_$CreateAssignmentRequestImpl) then) =
      __$$CreateAssignmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'bus_id') String busId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String? status});
}

/// @nodoc
class __$$CreateAssignmentRequestImplCopyWithImpl<$Res>
    extends _$CreateAssignmentRequestCopyWithImpl<$Res,
        _$CreateAssignmentRequestImpl>
    implements _$$CreateAssignmentRequestImplCopyWith<$Res> {
  __$$CreateAssignmentRequestImplCopyWithImpl(
      _$CreateAssignmentRequestImpl _value,
      $Res Function(_$CreateAssignmentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? busId = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CreateAssignmentRequestImpl(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAssignmentRequestImpl implements _CreateAssignmentRequest {
  const _$CreateAssignmentRequestImpl(
      {@JsonKey(name: 'driver_id') required this.driverId,
      @JsonKey(name: 'bus_id') required this.busId,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      this.status});

  factory _$CreateAssignmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAssignmentRequestImplFromJson(json);

  @override
  @JsonKey(name: 'driver_id')
  final String driverId;
  @override
  @JsonKey(name: 'bus_id')
  final String busId;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  final String? status;

  @override
  String toString() {
    return 'CreateAssignmentRequest(driverId: $driverId, busId: $busId, startTime: $startTime, endTime: $endTime, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAssignmentRequestImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, driverId, busId, startTime, endTime, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAssignmentRequestImplCopyWith<_$CreateAssignmentRequestImpl>
      get copyWith => __$$CreateAssignmentRequestImplCopyWithImpl<
          _$CreateAssignmentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAssignmentRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateAssignmentRequest implements CreateAssignmentRequest {
  const factory _CreateAssignmentRequest(
      {@JsonKey(name: 'driver_id') required final String driverId,
      @JsonKey(name: 'bus_id') required final String busId,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      final String? status}) = _$CreateAssignmentRequestImpl;

  factory _CreateAssignmentRequest.fromJson(Map<String, dynamic> json) =
      _$CreateAssignmentRequestImpl.fromJson;

  @override
  @JsonKey(name: 'driver_id')
  String get driverId;
  @override
  @JsonKey(name: 'bus_id')
  String get busId;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateAssignmentRequestImplCopyWith<_$CreateAssignmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
