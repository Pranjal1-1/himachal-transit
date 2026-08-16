// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_bus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearbyBus _$NearbyBusFromJson(Map<String, dynamic> json) {
  return _NearbyBus.fromJson(json);
}

/// @nodoc
mixin _$NearbyBus {
  Bus get bus => throw _privateConstructorUsedError;
  Route? get route => throw _privateConstructorUsedError;
  Trip? get trip => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  GpsLocation? get lastLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearbyBusCopyWith<NearbyBus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyBusCopyWith<$Res> {
  factory $NearbyBusCopyWith(NearbyBus value, $Res Function(NearbyBus) then) =
      _$NearbyBusCopyWithImpl<$Res, NearbyBus>;
  @useResult
  $Res call(
      {Bus bus,
      Route? route,
      Trip? trip,
      double distance,
      GpsLocation? lastLocation});

  $BusCopyWith<$Res> get bus;
  $RouteCopyWith<$Res>? get route;
  $TripCopyWith<$Res>? get trip;
  $GpsLocationCopyWith<$Res>? get lastLocation;
}

/// @nodoc
class _$NearbyBusCopyWithImpl<$Res, $Val extends NearbyBus>
    implements $NearbyBusCopyWith<$Res> {
  _$NearbyBusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bus = null,
    Object? route = freezed,
    Object? trip = freezed,
    Object? distance = null,
    Object? lastLocation = freezed,
  }) {
    return _then(_value.copyWith(
      bus: null == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trip?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      lastLocation: freezed == lastLocation
          ? _value.lastLocation
          : lastLocation // ignore: cast_nullable_to_non_nullable
              as GpsLocation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BusCopyWith<$Res> get bus {
    return $BusCopyWith<$Res>(_value.bus, (value) {
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
  $TripCopyWith<$Res>? get trip {
    if (_value.trip == null) {
      return null;
    }

    return $TripCopyWith<$Res>(_value.trip!, (value) {
      return _then(_value.copyWith(trip: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GpsLocationCopyWith<$Res>? get lastLocation {
    if (_value.lastLocation == null) {
      return null;
    }

    return $GpsLocationCopyWith<$Res>(_value.lastLocation!, (value) {
      return _then(_value.copyWith(lastLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearbyBusImplCopyWith<$Res>
    implements $NearbyBusCopyWith<$Res> {
  factory _$$NearbyBusImplCopyWith(
          _$NearbyBusImpl value, $Res Function(_$NearbyBusImpl) then) =
      __$$NearbyBusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Bus bus,
      Route? route,
      Trip? trip,
      double distance,
      GpsLocation? lastLocation});

  @override
  $BusCopyWith<$Res> get bus;
  @override
  $RouteCopyWith<$Res>? get route;
  @override
  $TripCopyWith<$Res>? get trip;
  @override
  $GpsLocationCopyWith<$Res>? get lastLocation;
}

/// @nodoc
class __$$NearbyBusImplCopyWithImpl<$Res>
    extends _$NearbyBusCopyWithImpl<$Res, _$NearbyBusImpl>
    implements _$$NearbyBusImplCopyWith<$Res> {
  __$$NearbyBusImplCopyWithImpl(
      _$NearbyBusImpl _value, $Res Function(_$NearbyBusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bus = null,
    Object? route = freezed,
    Object? trip = freezed,
    Object? distance = null,
    Object? lastLocation = freezed,
  }) {
    return _then(_$NearbyBusImpl(
      bus: null == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trip?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      lastLocation: freezed == lastLocation
          ? _value.lastLocation
          : lastLocation // ignore: cast_nullable_to_non_nullable
              as GpsLocation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyBusImpl implements _NearbyBus {
  const _$NearbyBusImpl(
      {required this.bus,
      this.route,
      this.trip,
      required this.distance,
      this.lastLocation});

  factory _$NearbyBusImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyBusImplFromJson(json);

  @override
  final Bus bus;
  @override
  final Route? route;
  @override
  final Trip? trip;
  @override
  final double distance;
  @override
  final GpsLocation? lastLocation;

  @override
  String toString() {
    return 'NearbyBus(bus: $bus, route: $route, trip: $trip, distance: $distance, lastLocation: $lastLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyBusImpl &&
            (identical(other.bus, bus) || other.bus == bus) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.lastLocation, lastLocation) ||
                other.lastLocation == lastLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bus, route, trip, distance, lastLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyBusImplCopyWith<_$NearbyBusImpl> get copyWith =>
      __$$NearbyBusImplCopyWithImpl<_$NearbyBusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyBusImplToJson(
      this,
    );
  }
}

abstract class _NearbyBus implements NearbyBus {
  const factory _NearbyBus(
      {required final Bus bus,
      final Route? route,
      final Trip? trip,
      required final double distance,
      final GpsLocation? lastLocation}) = _$NearbyBusImpl;

  factory _NearbyBus.fromJson(Map<String, dynamic> json) =
      _$NearbyBusImpl.fromJson;

  @override
  Bus get bus;
  @override
  Route? get route;
  @override
  Trip? get trip;
  @override
  double get distance;
  @override
  GpsLocation? get lastLocation;
  @override
  @JsonKey(ignore: true)
  _$$NearbyBusImplCopyWith<_$NearbyBusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GpsLocation _$GpsLocationFromJson(Map<String, dynamic> json) {
  return _GpsLocation.fromJson(json);
}

/// @nodoc
mixin _$GpsLocation {
  String get id => throw _privateConstructorUsedError;
  String get tripId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError;
  double? get heading => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  int get recordedAt => throw _privateConstructorUsedError;

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
      String tripId,
      double latitude,
      double longitude,
      double? speed,
      double? heading,
      double? accuracy,
      int recordedAt});
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
              as int,
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
      String tripId,
      double latitude,
      double longitude,
      double? speed,
      double? heading,
      double? accuracy,
      int recordedAt});
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
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GpsLocationImpl implements _GpsLocation {
  const _$GpsLocationImpl(
      {required this.id,
      required this.tripId,
      required this.latitude,
      required this.longitude,
      this.speed,
      this.heading,
      this.accuracy,
      required this.recordedAt});

  factory _$GpsLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GpsLocationImplFromJson(json);

  @override
  final String id;
  @override
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
  final int recordedAt;

  @override
  String toString() {
    return 'GpsLocation(id: $id, tripId: $tripId, latitude: $latitude, longitude: $longitude, speed: $speed, heading: $heading, accuracy: $accuracy, recordedAt: $recordedAt)';
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
                other.recordedAt == recordedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tripId, latitude, longitude,
      speed, heading, accuracy, recordedAt);

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
      required final String tripId,
      required final double latitude,
      required final double longitude,
      final double? speed,
      final double? heading,
      final double? accuracy,
      required final int recordedAt}) = _$GpsLocationImpl;

  factory _GpsLocation.fromJson(Map<String, dynamic> json) =
      _$GpsLocationImpl.fromJson;

  @override
  String get id;
  @override
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
  int get recordedAt;
  @override
  @JsonKey(ignore: true)
  _$$GpsLocationImplCopyWith<_$GpsLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
