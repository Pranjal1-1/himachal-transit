// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  String? get geometry => throw _privateConstructorUsedError;
  RouteStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  int? get stopsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res, Route>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'organization_id') String organizationId,
      String name,
      String? origin,
      String? destination,
      String? geometry,
      RouteStatus status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      String? duration,
      int? stopsCount});
}

/// @nodoc
class _$RouteCopyWithImpl<$Res, $Val extends Route>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? name = null,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? geometry = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? duration = freezed,
    Object? stopsCount = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      stopsCount: freezed == stopsCount
          ? _value.stopsCount
          : stopsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteImplCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$RouteImplCopyWith(
          _$RouteImpl value, $Res Function(_$RouteImpl) then) =
      __$$RouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'organization_id') String organizationId,
      String name,
      String? origin,
      String? destination,
      String? geometry,
      RouteStatus status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      String? duration,
      int? stopsCount});
}

/// @nodoc
class __$$RouteImplCopyWithImpl<$Res>
    extends _$RouteCopyWithImpl<$Res, _$RouteImpl>
    implements _$$RouteImplCopyWith<$Res> {
  __$$RouteImplCopyWithImpl(
      _$RouteImpl _value, $Res Function(_$RouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? name = null,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? geometry = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? duration = freezed,
    Object? stopsCount = freezed,
  }) {
    return _then(_$RouteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      stopsCount: freezed == stopsCount
          ? _value.stopsCount
          : stopsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteImpl implements _Route {
  const _$RouteImpl(
      {required this.id,
      @JsonKey(name: 'organization_id') required this.organizationId,
      required this.name,
      this.origin,
      this.destination,
      this.geometry,
      required this.status,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.duration,
      this.stopsCount});

  factory _$RouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  final String name;
  @override
  final String? origin;
  @override
  final String? destination;
  @override
  final String? geometry;
  @override
  final RouteStatus status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  final String? duration;
  @override
  final int? stopsCount;

  @override
  String toString() {
    return 'Route(id: $id, organizationId: $organizationId, name: $name, origin: $origin, destination: $destination, geometry: $geometry, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, duration: $duration, stopsCount: $stopsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.stopsCount, stopsCount) ||
                other.stopsCount == stopsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      organizationId,
      name,
      origin,
      destination,
      geometry,
      status,
      createdAt,
      updatedAt,
      duration,
      stopsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      __$$RouteImplCopyWithImpl<_$RouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteImplToJson(
      this,
    );
  }
}

abstract class _Route implements Route {
  const factory _Route(
      {required final String id,
      @JsonKey(name: 'organization_id') required final String organizationId,
      required final String name,
      final String? origin,
      final String? destination,
      final String? geometry,
      required final RouteStatus status,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final String? duration,
      final int? stopsCount}) = _$RouteImpl;

  factory _Route.fromJson(Map<String, dynamic> json) = _$RouteImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  String get name;
  @override
  String? get origin;
  @override
  String? get destination;
  @override
  String? get geometry;
  @override
  RouteStatus get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  String? get duration;
  @override
  int? get stopsCount;
  @override
  @JsonKey(ignore: true)
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteStop _$RouteStopFromJson(Map<String, dynamic> json) {
  return _RouteStop.fromJson(json);
}

/// @nodoc
mixin _$RouteStop {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_id')
  String get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_id')
  String get stopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_order')
  int get stopOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt =>
      throw _privateConstructorUsedError; // Nested stop data
  @JsonKey(name: 'stop', fromJson: _stopFromJson)
  Stop? get stop => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteStopCopyWith<RouteStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStopCopyWith<$Res> {
  factory $RouteStopCopyWith(RouteStop value, $Res Function(RouteStop) then) =
      _$RouteStopCopyWithImpl<$Res, RouteStop>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'route_id') String routeId,
      @JsonKey(name: 'stop_id') String stopId,
      @JsonKey(name: 'stop_order') int stopOrder,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'stop', fromJson: _stopFromJson) Stop? stop});

  $StopCopyWith<$Res>? get stop;
}

/// @nodoc
class _$RouteStopCopyWithImpl<$Res, $Val extends RouteStop>
    implements $RouteStopCopyWith<$Res> {
  _$RouteStopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? stopId = null,
    Object? stopOrder = null,
    Object? createdAt = freezed,
    Object? stop = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      stopId: null == stopId
          ? _value.stopId
          : stopId // ignore: cast_nullable_to_non_nullable
              as String,
      stopOrder: null == stopOrder
          ? _value.stopOrder
          : stopOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      stop: freezed == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StopCopyWith<$Res>? get stop {
    if (_value.stop == null) {
      return null;
    }

    return $StopCopyWith<$Res>(_value.stop!, (value) {
      return _then(_value.copyWith(stop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteStopImplCopyWith<$Res>
    implements $RouteStopCopyWith<$Res> {
  factory _$$RouteStopImplCopyWith(
          _$RouteStopImpl value, $Res Function(_$RouteStopImpl) then) =
      __$$RouteStopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'route_id') String routeId,
      @JsonKey(name: 'stop_id') String stopId,
      @JsonKey(name: 'stop_order') int stopOrder,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'stop', fromJson: _stopFromJson) Stop? stop});

  @override
  $StopCopyWith<$Res>? get stop;
}

/// @nodoc
class __$$RouteStopImplCopyWithImpl<$Res>
    extends _$RouteStopCopyWithImpl<$Res, _$RouteStopImpl>
    implements _$$RouteStopImplCopyWith<$Res> {
  __$$RouteStopImplCopyWithImpl(
      _$RouteStopImpl _value, $Res Function(_$RouteStopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? stopId = null,
    Object? stopOrder = null,
    Object? createdAt = freezed,
    Object? stop = freezed,
  }) {
    return _then(_$RouteStopImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      stopId: null == stopId
          ? _value.stopId
          : stopId // ignore: cast_nullable_to_non_nullable
              as String,
      stopOrder: null == stopOrder
          ? _value.stopOrder
          : stopOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      stop: freezed == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteStopImpl implements _RouteStop {
  const _$RouteStopImpl(
      {required this.id,
      @JsonKey(name: 'route_id') required this.routeId,
      @JsonKey(name: 'stop_id') required this.stopId,
      @JsonKey(name: 'stop_order') required this.stopOrder,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'stop', fromJson: _stopFromJson) this.stop});

  factory _$RouteStopImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteStopImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'route_id')
  final String routeId;
  @override
  @JsonKey(name: 'stop_id')
  final String stopId;
  @override
  @JsonKey(name: 'stop_order')
  final int stopOrder;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
// Nested stop data
  @override
  @JsonKey(name: 'stop', fromJson: _stopFromJson)
  final Stop? stop;

  @override
  String toString() {
    return 'RouteStop(id: $id, routeId: $routeId, stopId: $stopId, stopOrder: $stopOrder, createdAt: $createdAt, stop: $stop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteStopImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.stopId, stopId) || other.stopId == stopId) &&
            (identical(other.stopOrder, stopOrder) ||
                other.stopOrder == stopOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.stop, stop) || other.stop == stop));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, routeId, stopId, stopOrder, createdAt, stop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteStopImplCopyWith<_$RouteStopImpl> get copyWith =>
      __$$RouteStopImplCopyWithImpl<_$RouteStopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteStopImplToJson(
      this,
    );
  }
}

abstract class _RouteStop implements RouteStop {
  const factory _RouteStop(
          {required final String id,
          @JsonKey(name: 'route_id') required final String routeId,
          @JsonKey(name: 'stop_id') required final String stopId,
          @JsonKey(name: 'stop_order') required final int stopOrder,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'stop', fromJson: _stopFromJson) final Stop? stop}) =
      _$RouteStopImpl;

  factory _RouteStop.fromJson(Map<String, dynamic> json) =
      _$RouteStopImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'route_id')
  String get routeId;
  @override
  @JsonKey(name: 'stop_id')
  String get stopId;
  @override
  @JsonKey(name: 'stop_order')
  int get stopOrder;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override // Nested stop data
  @JsonKey(name: 'stop', fromJson: _stopFromJson)
  Stop? get stop;
  @override
  @JsonKey(ignore: true)
  _$$RouteStopImplCopyWith<_$RouteStopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateRouteRequest _$CreateRouteRequestFromJson(Map<String, dynamic> json) {
  return _CreateRouteRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateRouteRequest {
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  String? get geometry => throw _privateConstructorUsedError;
  RouteStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRouteRequestCopyWith<CreateRouteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRouteRequestCopyWith<$Res> {
  factory $CreateRouteRequestCopyWith(
          CreateRouteRequest value, $Res Function(CreateRouteRequest) then) =
      _$CreateRouteRequestCopyWithImpl<$Res, CreateRouteRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'organization_id') String organizationId,
      String name,
      String? origin,
      String? destination,
      String? geometry,
      RouteStatus? status});
}

/// @nodoc
class _$CreateRouteRequestCopyWithImpl<$Res, $Val extends CreateRouteRequest>
    implements $CreateRouteRequestCopyWith<$Res> {
  _$CreateRouteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? name = null,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? geometry = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRouteRequestImplCopyWith<$Res>
    implements $CreateRouteRequestCopyWith<$Res> {
  factory _$$CreateRouteRequestImplCopyWith(_$CreateRouteRequestImpl value,
          $Res Function(_$CreateRouteRequestImpl) then) =
      __$$CreateRouteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'organization_id') String organizationId,
      String name,
      String? origin,
      String? destination,
      String? geometry,
      RouteStatus? status});
}

/// @nodoc
class __$$CreateRouteRequestImplCopyWithImpl<$Res>
    extends _$CreateRouteRequestCopyWithImpl<$Res, _$CreateRouteRequestImpl>
    implements _$$CreateRouteRequestImplCopyWith<$Res> {
  __$$CreateRouteRequestImplCopyWithImpl(_$CreateRouteRequestImpl _value,
      $Res Function(_$CreateRouteRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? name = null,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? geometry = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CreateRouteRequestImpl(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRouteRequestImpl implements _CreateRouteRequest {
  const _$CreateRouteRequestImpl(
      {@JsonKey(name: 'organization_id') required this.organizationId,
      required this.name,
      this.origin,
      this.destination,
      this.geometry,
      this.status});

  factory _$CreateRouteRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRouteRequestImplFromJson(json);

  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  final String name;
  @override
  final String? origin;
  @override
  final String? destination;
  @override
  final String? geometry;
  @override
  final RouteStatus? status;

  @override
  String toString() {
    return 'CreateRouteRequest(organizationId: $organizationId, name: $name, origin: $origin, destination: $destination, geometry: $geometry, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRouteRequestImpl &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, organizationId, name, origin, destination, geometry, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRouteRequestImplCopyWith<_$CreateRouteRequestImpl> get copyWith =>
      __$$CreateRouteRequestImplCopyWithImpl<_$CreateRouteRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRouteRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateRouteRequest implements CreateRouteRequest {
  const factory _CreateRouteRequest(
      {@JsonKey(name: 'organization_id') required final String organizationId,
      required final String name,
      final String? origin,
      final String? destination,
      final String? geometry,
      final RouteStatus? status}) = _$CreateRouteRequestImpl;

  factory _CreateRouteRequest.fromJson(Map<String, dynamic> json) =
      _$CreateRouteRequestImpl.fromJson;

  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  String get name;
  @override
  String? get origin;
  @override
  String? get destination;
  @override
  String? get geometry;
  @override
  RouteStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateRouteRequestImplCopyWith<_$CreateRouteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateRouteRequest _$UpdateRouteRequestFromJson(Map<String, dynamic> json) {
  return _UpdateRouteRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateRouteRequest {
  String? get name => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  String? get geometry => throw _privateConstructorUsedError;
  RouteStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateRouteRequestCopyWith<UpdateRouteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRouteRequestCopyWith<$Res> {
  factory $UpdateRouteRequestCopyWith(
          UpdateRouteRequest value, $Res Function(UpdateRouteRequest) then) =
      _$UpdateRouteRequestCopyWithImpl<$Res, UpdateRouteRequest>;
  @useResult
  $Res call(
      {String? name,
      String? origin,
      String? destination,
      String? geometry,
      RouteStatus? status});
}

/// @nodoc
class _$UpdateRouteRequestCopyWithImpl<$Res, $Val extends UpdateRouteRequest>
    implements $UpdateRouteRequestCopyWith<$Res> {
  _$UpdateRouteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? geometry = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateRouteRequestImplCopyWith<$Res>
    implements $UpdateRouteRequestCopyWith<$Res> {
  factory _$$UpdateRouteRequestImplCopyWith(_$UpdateRouteRequestImpl value,
          $Res Function(_$UpdateRouteRequestImpl) then) =
      __$$UpdateRouteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? origin,
      String? destination,
      String? geometry,
      RouteStatus? status});
}

/// @nodoc
class __$$UpdateRouteRequestImplCopyWithImpl<$Res>
    extends _$UpdateRouteRequestCopyWithImpl<$Res, _$UpdateRouteRequestImpl>
    implements _$$UpdateRouteRequestImplCopyWith<$Res> {
  __$$UpdateRouteRequestImplCopyWithImpl(_$UpdateRouteRequestImpl _value,
      $Res Function(_$UpdateRouteRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? geometry = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UpdateRouteRequestImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateRouteRequestImpl implements _UpdateRouteRequest {
  const _$UpdateRouteRequestImpl(
      {this.name, this.origin, this.destination, this.geometry, this.status});

  factory _$UpdateRouteRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateRouteRequestImplFromJson(json);

  @override
  final String? name;
  @override
  final String? origin;
  @override
  final String? destination;
  @override
  final String? geometry;
  @override
  final RouteStatus? status;

  @override
  String toString() {
    return 'UpdateRouteRequest(name: $name, origin: $origin, destination: $destination, geometry: $geometry, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRouteRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, origin, destination, geometry, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRouteRequestImplCopyWith<_$UpdateRouteRequestImpl> get copyWith =>
      __$$UpdateRouteRequestImplCopyWithImpl<_$UpdateRouteRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateRouteRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateRouteRequest implements UpdateRouteRequest {
  const factory _UpdateRouteRequest(
      {final String? name,
      final String? origin,
      final String? destination,
      final String? geometry,
      final RouteStatus? status}) = _$UpdateRouteRequestImpl;

  factory _UpdateRouteRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateRouteRequestImpl.fromJson;

  @override
  String? get name;
  @override
  String? get origin;
  @override
  String? get destination;
  @override
  String? get geometry;
  @override
  RouteStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$UpdateRouteRequestImplCopyWith<_$UpdateRouteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateRouteStopRequest _$CreateRouteStopRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateRouteStopRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateRouteStopRequest {
  @JsonKey(name: 'route_id')
  String get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_id')
  String get stopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_order')
  int get stopOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRouteStopRequestCopyWith<CreateRouteStopRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRouteStopRequestCopyWith<$Res> {
  factory $CreateRouteStopRequestCopyWith(CreateRouteStopRequest value,
          $Res Function(CreateRouteStopRequest) then) =
      _$CreateRouteStopRequestCopyWithImpl<$Res, CreateRouteStopRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'route_id') String routeId,
      @JsonKey(name: 'stop_id') String stopId,
      @JsonKey(name: 'stop_order') int stopOrder});
}

/// @nodoc
class _$CreateRouteStopRequestCopyWithImpl<$Res,
        $Val extends CreateRouteStopRequest>
    implements $CreateRouteStopRequestCopyWith<$Res> {
  _$CreateRouteStopRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = null,
    Object? stopId = null,
    Object? stopOrder = null,
  }) {
    return _then(_value.copyWith(
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      stopId: null == stopId
          ? _value.stopId
          : stopId // ignore: cast_nullable_to_non_nullable
              as String,
      stopOrder: null == stopOrder
          ? _value.stopOrder
          : stopOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRouteStopRequestImplCopyWith<$Res>
    implements $CreateRouteStopRequestCopyWith<$Res> {
  factory _$$CreateRouteStopRequestImplCopyWith(
          _$CreateRouteStopRequestImpl value,
          $Res Function(_$CreateRouteStopRequestImpl) then) =
      __$$CreateRouteStopRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'route_id') String routeId,
      @JsonKey(name: 'stop_id') String stopId,
      @JsonKey(name: 'stop_order') int stopOrder});
}

/// @nodoc
class __$$CreateRouteStopRequestImplCopyWithImpl<$Res>
    extends _$CreateRouteStopRequestCopyWithImpl<$Res,
        _$CreateRouteStopRequestImpl>
    implements _$$CreateRouteStopRequestImplCopyWith<$Res> {
  __$$CreateRouteStopRequestImplCopyWithImpl(
      _$CreateRouteStopRequestImpl _value,
      $Res Function(_$CreateRouteStopRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = null,
    Object? stopId = null,
    Object? stopOrder = null,
  }) {
    return _then(_$CreateRouteStopRequestImpl(
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      stopId: null == stopId
          ? _value.stopId
          : stopId // ignore: cast_nullable_to_non_nullable
              as String,
      stopOrder: null == stopOrder
          ? _value.stopOrder
          : stopOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRouteStopRequestImpl implements _CreateRouteStopRequest {
  const _$CreateRouteStopRequestImpl(
      {@JsonKey(name: 'route_id') required this.routeId,
      @JsonKey(name: 'stop_id') required this.stopId,
      @JsonKey(name: 'stop_order') required this.stopOrder});

  factory _$CreateRouteStopRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRouteStopRequestImplFromJson(json);

  @override
  @JsonKey(name: 'route_id')
  final String routeId;
  @override
  @JsonKey(name: 'stop_id')
  final String stopId;
  @override
  @JsonKey(name: 'stop_order')
  final int stopOrder;

  @override
  String toString() {
    return 'CreateRouteStopRequest(routeId: $routeId, stopId: $stopId, stopOrder: $stopOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRouteStopRequestImpl &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.stopId, stopId) || other.stopId == stopId) &&
            (identical(other.stopOrder, stopOrder) ||
                other.stopOrder == stopOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, routeId, stopId, stopOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRouteStopRequestImplCopyWith<_$CreateRouteStopRequestImpl>
      get copyWith => __$$CreateRouteStopRequestImplCopyWithImpl<
          _$CreateRouteStopRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRouteStopRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateRouteStopRequest implements CreateRouteStopRequest {
  const factory _CreateRouteStopRequest(
          {@JsonKey(name: 'route_id') required final String routeId,
          @JsonKey(name: 'stop_id') required final String stopId,
          @JsonKey(name: 'stop_order') required final int stopOrder}) =
      _$CreateRouteStopRequestImpl;

  factory _CreateRouteStopRequest.fromJson(Map<String, dynamic> json) =
      _$CreateRouteStopRequestImpl.fromJson;

  @override
  @JsonKey(name: 'route_id')
  String get routeId;
  @override
  @JsonKey(name: 'stop_id')
  String get stopId;
  @override
  @JsonKey(name: 'stop_order')
  int get stopOrder;
  @override
  @JsonKey(ignore: true)
  _$$CreateRouteStopRequestImplCopyWith<_$CreateRouteStopRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
