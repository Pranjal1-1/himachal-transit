// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_id')
  String? get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_id')
  String? get busId => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_id')
  String? get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError; // Nested data
  @JsonKey(name: 'bus', fromJson: _busFromJson)
  Bus? get bus => throw _privateConstructorUsedError;
  @JsonKey(name: 'route', fromJson: _routeFromJson)
  Route? get route => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver', fromJson: _driverFromJson)
  Driver? get driver => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'driver_id') String? driverId,
      @JsonKey(name: 'bus_id') String? busId,
      @JsonKey(name: 'route_id') String? routeId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'bus', fromJson: _busFromJson) Bus? bus,
      @JsonKey(name: 'route', fromJson: _routeFromJson) Route? route,
      @JsonKey(name: 'driver', fromJson: _driverFromJson) Driver? driver});

  $BusCopyWith<$Res>? get bus;
  $RouteCopyWith<$Res>? get route;
  $DriverCopyWith<$Res>? get driver;
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = freezed,
    Object? busId = freezed,
    Object? routeId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? bus = freezed,
    Object? route = freezed,
    Object? driver = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      busId: freezed == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String?,
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      bus: freezed == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $RouteCopyWith<$Res>? get route {
    if (_value.route == null) {
      return null;
    }

    return $RouteCopyWith<$Res>(_value.route!, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
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
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'driver_id') String? driverId,
      @JsonKey(name: 'bus_id') String? busId,
      @JsonKey(name: 'route_id') String? routeId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'bus', fromJson: _busFromJson) Bus? bus,
      @JsonKey(name: 'route', fromJson: _routeFromJson) Route? route,
      @JsonKey(name: 'driver', fromJson: _driverFromJson) Driver? driver});

  @override
  $BusCopyWith<$Res>? get bus;
  @override
  $RouteCopyWith<$Res>? get route;
  @override
  $DriverCopyWith<$Res>? get driver;
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = freezed,
    Object? busId = freezed,
    Object? routeId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? bus = freezed,
    Object? route = freezed,
    Object? driver = freezed,
  }) {
    return _then(_$TripImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      busId: freezed == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String?,
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      bus: freezed == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripImpl implements _Trip {
  const _$TripImpl(
      {required this.id,
      @JsonKey(name: 'driver_id') this.driverId,
      @JsonKey(name: 'bus_id') this.busId,
      @JsonKey(name: 'route_id') this.routeId,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      required this.status,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'bus', fromJson: _busFromJson) this.bus,
      @JsonKey(name: 'route', fromJson: _routeFromJson) this.route,
      @JsonKey(name: 'driver', fromJson: _driverFromJson) this.driver});

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'driver_id')
  final String? driverId;
  @override
  @JsonKey(name: 'bus_id')
  final String? busId;
  @override
  @JsonKey(name: 'route_id')
  final String? routeId;
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
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
// Nested data
  @override
  @JsonKey(name: 'bus', fromJson: _busFromJson)
  final Bus? bus;
  @override
  @JsonKey(name: 'route', fromJson: _routeFromJson)
  final Route? route;
  @override
  @JsonKey(name: 'driver', fromJson: _driverFromJson)
  final Driver? driver;

  @override
  String toString() {
    return 'Trip(id: $id, driverId: $driverId, busId: $busId, routeId: $routeId, startTime: $startTime, endTime: $endTime, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, bus: $bus, route: $route, driver: $driver)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.bus, bus) || other.bus == bus) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.driver, driver) || other.driver == driver));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, driverId, busId, routeId,
      startTime, endTime, status, createdAt, updatedAt, bus, route, driver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(
      this,
    );
  }
}

abstract class _Trip implements Trip {
  const factory _Trip(
      {required final String id,
      @JsonKey(name: 'driver_id') final String? driverId,
      @JsonKey(name: 'bus_id') final String? busId,
      @JsonKey(name: 'route_id') final String? routeId,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      required final String status,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'bus', fromJson: _busFromJson) final Bus? bus,
      @JsonKey(name: 'route', fromJson: _routeFromJson) final Route? route,
      @JsonKey(name: 'driver', fromJson: _driverFromJson)
      final Driver? driver}) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'driver_id')
  String? get driverId;
  @override
  @JsonKey(name: 'bus_id')
  String? get busId;
  @override
  @JsonKey(name: 'route_id')
  String? get routeId;
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
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override // Nested data
  @JsonKey(name: 'bus', fromJson: _busFromJson)
  Bus? get bus;
  @override
  @JsonKey(name: 'route', fromJson: _routeFromJson)
  Route? get route;
  @override
  @JsonKey(name: 'driver', fromJson: _driverFromJson)
  Driver? get driver;
  @override
  @JsonKey(ignore: true)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTripRequest _$CreateTripRequestFromJson(Map<String, dynamic> json) {
  return _CreateTripRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTripRequest {
  @JsonKey(name: 'driver_id')
  String get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_id')
  String get busId => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_id')
  String get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTripRequestCopyWith<CreateTripRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTripRequestCopyWith<$Res> {
  factory $CreateTripRequestCopyWith(
          CreateTripRequest value, $Res Function(CreateTripRequest) then) =
      _$CreateTripRequestCopyWithImpl<$Res, CreateTripRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'bus_id') String busId,
      @JsonKey(name: 'route_id') String routeId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String? status});
}

/// @nodoc
class _$CreateTripRequestCopyWithImpl<$Res, $Val extends CreateTripRequest>
    implements $CreateTripRequestCopyWith<$Res> {
  _$CreateTripRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? busId = null,
    Object? routeId = null,
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
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CreateTripRequestImplCopyWith<$Res>
    implements $CreateTripRequestCopyWith<$Res> {
  factory _$$CreateTripRequestImplCopyWith(_$CreateTripRequestImpl value,
          $Res Function(_$CreateTripRequestImpl) then) =
      __$$CreateTripRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'bus_id') String busId,
      @JsonKey(name: 'route_id') String routeId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String? status});
}

/// @nodoc
class __$$CreateTripRequestImplCopyWithImpl<$Res>
    extends _$CreateTripRequestCopyWithImpl<$Res, _$CreateTripRequestImpl>
    implements _$$CreateTripRequestImplCopyWith<$Res> {
  __$$CreateTripRequestImplCopyWithImpl(_$CreateTripRequestImpl _value,
      $Res Function(_$CreateTripRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? busId = null,
    Object? routeId = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CreateTripRequestImpl(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
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
class _$CreateTripRequestImpl implements _CreateTripRequest {
  const _$CreateTripRequestImpl(
      {@JsonKey(name: 'driver_id') required this.driverId,
      @JsonKey(name: 'bus_id') required this.busId,
      @JsonKey(name: 'route_id') required this.routeId,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      this.status});

  factory _$CreateTripRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTripRequestImplFromJson(json);

  @override
  @JsonKey(name: 'driver_id')
  final String driverId;
  @override
  @JsonKey(name: 'bus_id')
  final String busId;
  @override
  @JsonKey(name: 'route_id')
  final String routeId;
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
    return 'CreateTripRequest(driverId: $driverId, busId: $busId, routeId: $routeId, startTime: $startTime, endTime: $endTime, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTripRequestImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, driverId, busId, routeId, startTime, endTime, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTripRequestImplCopyWith<_$CreateTripRequestImpl> get copyWith =>
      __$$CreateTripRequestImplCopyWithImpl<_$CreateTripRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTripRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateTripRequest implements CreateTripRequest {
  const factory _CreateTripRequest(
      {@JsonKey(name: 'driver_id') required final String driverId,
      @JsonKey(name: 'bus_id') required final String busId,
      @JsonKey(name: 'route_id') required final String routeId,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      final String? status}) = _$CreateTripRequestImpl;

  factory _CreateTripRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTripRequestImpl.fromJson;

  @override
  @JsonKey(name: 'driver_id')
  String get driverId;
  @override
  @JsonKey(name: 'bus_id')
  String get busId;
  @override
  @JsonKey(name: 'route_id')
  String get routeId;
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
  _$$CreateTripRequestImplCopyWith<_$CreateTripRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateTripRequest _$UpdateTripRequestFromJson(Map<String, dynamic> json) {
  return _UpdateTripRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateTripRequest {
  @JsonKey(name: 'driver_id')
  String? get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_id')
  String? get busId => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_id')
  String? get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTripRequestCopyWith<UpdateTripRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTripRequestCopyWith<$Res> {
  factory $UpdateTripRequestCopyWith(
          UpdateTripRequest value, $Res Function(UpdateTripRequest) then) =
      _$UpdateTripRequestCopyWithImpl<$Res, UpdateTripRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'driver_id') String? driverId,
      @JsonKey(name: 'bus_id') String? busId,
      @JsonKey(name: 'route_id') String? routeId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String? status});
}

/// @nodoc
class _$UpdateTripRequestCopyWithImpl<$Res, $Val extends UpdateTripRequest>
    implements $UpdateTripRequestCopyWith<$Res> {
  _$UpdateTripRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = freezed,
    Object? busId = freezed,
    Object? routeId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      busId: freezed == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String?,
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$UpdateTripRequestImplCopyWith<$Res>
    implements $UpdateTripRequestCopyWith<$Res> {
  factory _$$UpdateTripRequestImplCopyWith(_$UpdateTripRequestImpl value,
          $Res Function(_$UpdateTripRequestImpl) then) =
      __$$UpdateTripRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'driver_id') String? driverId,
      @JsonKey(name: 'bus_id') String? busId,
      @JsonKey(name: 'route_id') String? routeId,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String? status});
}

/// @nodoc
class __$$UpdateTripRequestImplCopyWithImpl<$Res>
    extends _$UpdateTripRequestCopyWithImpl<$Res, _$UpdateTripRequestImpl>
    implements _$$UpdateTripRequestImplCopyWith<$Res> {
  __$$UpdateTripRequestImplCopyWithImpl(_$UpdateTripRequestImpl _value,
      $Res Function(_$UpdateTripRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = freezed,
    Object? busId = freezed,
    Object? routeId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UpdateTripRequestImpl(
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      busId: freezed == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String?,
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$UpdateTripRequestImpl implements _UpdateTripRequest {
  const _$UpdateTripRequestImpl(
      {@JsonKey(name: 'driver_id') this.driverId,
      @JsonKey(name: 'bus_id') this.busId,
      @JsonKey(name: 'route_id') this.routeId,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      this.status});

  factory _$UpdateTripRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTripRequestImplFromJson(json);

  @override
  @JsonKey(name: 'driver_id')
  final String? driverId;
  @override
  @JsonKey(name: 'bus_id')
  final String? busId;
  @override
  @JsonKey(name: 'route_id')
  final String? routeId;
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
    return 'UpdateTripRequest(driverId: $driverId, busId: $busId, routeId: $routeId, startTime: $startTime, endTime: $endTime, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTripRequestImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, driverId, busId, routeId, startTime, endTime, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTripRequestImplCopyWith<_$UpdateTripRequestImpl> get copyWith =>
      __$$UpdateTripRequestImplCopyWithImpl<_$UpdateTripRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTripRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateTripRequest implements UpdateTripRequest {
  const factory _UpdateTripRequest(
      {@JsonKey(name: 'driver_id') final String? driverId,
      @JsonKey(name: 'bus_id') final String? busId,
      @JsonKey(name: 'route_id') final String? routeId,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      final String? status}) = _$UpdateTripRequestImpl;

  factory _UpdateTripRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateTripRequestImpl.fromJson;

  @override
  @JsonKey(name: 'driver_id')
  String? get driverId;
  @override
  @JsonKey(name: 'bus_id')
  String? get busId;
  @override
  @JsonKey(name: 'route_id')
  String? get routeId;
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
  _$$UpdateTripRequestImplCopyWith<_$UpdateTripRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GpsLocation _$GpsLocationFromJson(Map<String, dynamic> json) {
  return _GpsLocation.fromJson(json);
}

/// @nodoc
mixin _$GpsLocation {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'trip_id')
  String get tripId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError;
  double? get heading => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_at')
  String get recordedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'geom')
  Map<String, dynamic>? get geom => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GpsLocationCopyWith<GpsLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GpsLocationCopyWith<$Res> {
  factory $GpsLocationCopyWith(
          GpsLocation value, $Res Function(GpsLocation) then) =
      _$GpsLocationCopyWithImpl<$Res, GpsLocation>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'trip_id') String tripId,
      double latitude,
      double longitude,
      double? speed,
      double? heading,
      double? accuracy,
      @JsonKey(name: 'recorded_at') String recordedAt,
      @JsonKey(name: 'geom') Map<String, dynamic>? geom,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$GpsLocationCopyWithImpl<$Res, $Val extends GpsLocation>
    implements $GpsLocationCopyWith<$Res> {
  _$GpsLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tripId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? speed = freezed,
    Object? heading = freezed,
    Object? accuracy = freezed,
    Object? recordedAt = null,
    Object? geom = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as String,
      geom: freezed == geom
          ? _value.geom
          : geom // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GpsLocationImplCopyWith<$Res>
    implements $GpsLocationCopyWith<$Res> {
  factory _$$GpsLocationImplCopyWith(
          _$GpsLocationImpl value, $Res Function(_$GpsLocationImpl) then) =
      __$$GpsLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'trip_id') String tripId,
      double latitude,
      double longitude,
      double? speed,
      double? heading,
      double? accuracy,
      @JsonKey(name: 'recorded_at') String recordedAt,
      @JsonKey(name: 'geom') Map<String, dynamic>? geom,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$GpsLocationImplCopyWithImpl<$Res>
    extends _$GpsLocationCopyWithImpl<$Res, _$GpsLocationImpl>
    implements _$$GpsLocationImplCopyWith<$Res> {
  __$$GpsLocationImplCopyWithImpl(
      _$GpsLocationImpl _value, $Res Function(_$GpsLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tripId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? speed = freezed,
    Object? heading = freezed,
    Object? accuracy = freezed,
    Object? recordedAt = null,
    Object? geom = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$GpsLocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as String,
      geom: freezed == geom
          ? _value._geom
          : geom // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GpsLocationImpl implements _GpsLocation {
  const _$GpsLocationImpl(
      {required this.id,
      @JsonKey(name: 'trip_id') required this.tripId,
      required this.latitude,
      required this.longitude,
      this.speed,
      this.heading,
      this.accuracy,
      @JsonKey(name: 'recorded_at') required this.recordedAt,
      @JsonKey(name: 'geom') final Map<String, dynamic>? geom,
      @JsonKey(name: 'created_at') this.createdAt})
      : _geom = geom;

  factory _$GpsLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GpsLocationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'trip_id')
  final String tripId;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? speed;
  @override
  final double? heading;
  @override
  final double? accuracy;
  @override
  @JsonKey(name: 'recorded_at')
  final String recordedAt;
  final Map<String, dynamic>? _geom;
  @override
  @JsonKey(name: 'geom')
  Map<String, dynamic>? get geom {
    final value = _geom;
    if (value == null) return null;
    if (_geom is EqualUnmodifiableMapView) return _geom;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'GpsLocation(id: $id, tripId: $tripId, latitude: $latitude, longitude: $longitude, speed: $speed, heading: $heading, accuracy: $accuracy, recordedAt: $recordedAt, geom: $geom, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GpsLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            const DeepCollectionEquality().equals(other._geom, _geom) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tripId,
      latitude,
      longitude,
      speed,
      heading,
      accuracy,
      recordedAt,
      const DeepCollectionEquality().hash(_geom),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GpsLocationImplCopyWith<_$GpsLocationImpl> get copyWith =>
      __$$GpsLocationImplCopyWithImpl<_$GpsLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GpsLocationImplToJson(
      this,
    );
  }
}

abstract class _GpsLocation implements GpsLocation {
  const factory _GpsLocation(
          {required final String id,
          @JsonKey(name: 'trip_id') required final String tripId,
          required final double latitude,
          required final double longitude,
          final double? speed,
          final double? heading,
          final double? accuracy,
          @JsonKey(name: 'recorded_at') required final String recordedAt,
          @JsonKey(name: 'geom') final Map<String, dynamic>? geom,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$GpsLocationImpl;

  factory _GpsLocation.fromJson(Map<String, dynamic> json) =
      _$GpsLocationImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'trip_id')
  String get tripId;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double? get speed;
  @override
  double? get heading;
  @override
  double? get accuracy;
  @override
  @JsonKey(name: 'recorded_at')
  String get recordedAt;
  @override
  @JsonKey(name: 'geom')
  Map<String, dynamic>? get geom;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$GpsLocationImplCopyWith<_$GpsLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateGpsLocationRequest _$CreateGpsLocationRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateGpsLocationRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateGpsLocationRequest {
  @JsonKey(name: 'trip_id')
  String get tripId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError;
  double? get heading => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_at')
  String? get recordedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateGpsLocationRequestCopyWith<CreateGpsLocationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGpsLocationRequestCopyWith<$Res> {
  factory $CreateGpsLocationRequestCopyWith(CreateGpsLocationRequest value,
          $Res Function(CreateGpsLocationRequest) then) =
      _$CreateGpsLocationRequestCopyWithImpl<$Res, CreateGpsLocationRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'trip_id') String tripId,
      double latitude,
      double longitude,
      double? speed,
      double? heading,
      double? accuracy,
      @JsonKey(name: 'recorded_at') String? recordedAt});
}

/// @nodoc
class _$CreateGpsLocationRequestCopyWithImpl<$Res,
        $Val extends CreateGpsLocationRequest>
    implements $CreateGpsLocationRequestCopyWith<$Res> {
  _$CreateGpsLocationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? speed = freezed,
    Object? heading = freezed,
    Object? accuracy = freezed,
    Object? recordedAt = freezed,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateGpsLocationRequestImplCopyWith<$Res>
    implements $CreateGpsLocationRequestCopyWith<$Res> {
  factory _$$CreateGpsLocationRequestImplCopyWith(
          _$CreateGpsLocationRequestImpl value,
          $Res Function(_$CreateGpsLocationRequestImpl) then) =
      __$$CreateGpsLocationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'trip_id') String tripId,
      double latitude,
      double longitude,
      double? speed,
      double? heading,
      double? accuracy,
      @JsonKey(name: 'recorded_at') String? recordedAt});
}

/// @nodoc
class __$$CreateGpsLocationRequestImplCopyWithImpl<$Res>
    extends _$CreateGpsLocationRequestCopyWithImpl<$Res,
        _$CreateGpsLocationRequestImpl>
    implements _$$CreateGpsLocationRequestImplCopyWith<$Res> {
  __$$CreateGpsLocationRequestImplCopyWithImpl(
      _$CreateGpsLocationRequestImpl _value,
      $Res Function(_$CreateGpsLocationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? speed = freezed,
    Object? heading = freezed,
    Object? accuracy = freezed,
    Object? recordedAt = freezed,
  }) {
    return _then(_$CreateGpsLocationRequestImpl(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateGpsLocationRequestImpl implements _CreateGpsLocationRequest {
  const _$CreateGpsLocationRequestImpl(
      {@JsonKey(name: 'trip_id') required this.tripId,
      required this.latitude,
      required this.longitude,
      this.speed,
      this.heading,
      this.accuracy,
      @JsonKey(name: 'recorded_at') this.recordedAt});

  factory _$CreateGpsLocationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateGpsLocationRequestImplFromJson(json);

  @override
  @JsonKey(name: 'trip_id')
  final String tripId;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? speed;
  @override
  final double? heading;
  @override
  final double? accuracy;
  @override
  @JsonKey(name: 'recorded_at')
  final String? recordedAt;

  @override
  String toString() {
    return 'CreateGpsLocationRequest(tripId: $tripId, latitude: $latitude, longitude: $longitude, speed: $speed, heading: $heading, accuracy: $accuracy, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGpsLocationRequestImpl &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tripId, latitude, longitude,
      speed, heading, accuracy, recordedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGpsLocationRequestImplCopyWith<_$CreateGpsLocationRequestImpl>
      get copyWith => __$$CreateGpsLocationRequestImplCopyWithImpl<
          _$CreateGpsLocationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateGpsLocationRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateGpsLocationRequest implements CreateGpsLocationRequest {
  const factory _CreateGpsLocationRequest(
          {@JsonKey(name: 'trip_id') required final String tripId,
          required final double latitude,
          required final double longitude,
          final double? speed,
          final double? heading,
          final double? accuracy,
          @JsonKey(name: 'recorded_at') final String? recordedAt}) =
      _$CreateGpsLocationRequestImpl;

  factory _CreateGpsLocationRequest.fromJson(Map<String, dynamic> json) =
      _$CreateGpsLocationRequestImpl.fromJson;

  @override
  @JsonKey(name: 'trip_id')
  String get tripId;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double? get speed;
  @override
  double? get heading;
  @override
  double? get accuracy;
  @override
  @JsonKey(name: 'recorded_at')
  String? get recordedAt;
  @override
  @JsonKey(ignore: true)
  _$$CreateGpsLocationRequestImplCopyWith<_$CreateGpsLocationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
